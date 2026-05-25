# ==========================================
# Google Provider Configuration
# ==========================================
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# ==========================================
# 1. The GKE Control Plane
# ==========================================
resource "google_container_cluster" "primary" {
  name     = "production-gitops-cluster"
  location = var.zone

  # Uses the variable defined in variables.tf
  deletion_protection = var.deletion_protection

  remove_default_node_pool = true
  initial_node_count       = 1

  # FIXED: Renamed to cluster_autoscaling
  cluster_autoscaling {
    enabled = true
    resource_limits {
      resource_type = "cpu"
      maximum       = 20
    }
    resource_limits {
      resource_type = "memory"
      maximum       = 64
    }
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

# ==========================================
# 2. The Managed Worker Nodes
# ==========================================
resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  
  autoscaling {
    min_node_count = 2
    max_node_count = 5
  }

  node_config {
    machine_type = "e2-standard-4" 

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only"
    ]
  }
}
