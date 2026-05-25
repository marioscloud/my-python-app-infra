variable "project_id" {
  description = "The GCP Project ID where resources will be deployed."
  type        = string
  # No default! This forces the user to explicitly define it in tfvars.
}

variable "region" {
  description = "The GCP Region for the cluster."
  type        = string
  default     = "europe-west3" # Frankfurt
}

variable "zone" {
  description = "The GCP Zone for the control plane and nodes."
  type        = string
  default     = "europe-west3-a"
}

variable "deletion_protection" {
  description = "Safeguard against accidental deletion. False for testing, True for production."
  type        = bool
  default     = false 
}
