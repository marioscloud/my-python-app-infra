# ☁️ GCP Infrastructure as Code (IaC) - GKE Provisioning

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Google Cloud](https://img.shields.io/badge/GoogleCloud-%234285F4.svg?style=for-the-badge&logo=google-cloud&logoColor=white)
![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)

## 📖 Overview
This repository houses the foundational Infrastructure as Code (IaC) required to provision a production-grade, highly available Google Kubernetes Engine (GKE) cluster in Google Cloud Platform (GCP). 

It is designed with security and scalability in mind, automating the creation of the underlying VPC networks, subnets, firewall rules, and the GKE cluster itself using **HashiCorp Terraform**.

> **Architectural Note:** This repository is **Part 1 of a 3-tier GitOps ecosystem**. It strictly handles infrastructure provisioning. Application source code and Continuous Delivery (GitOps) states are decoupled and managed in their respective repositories to limit blast radius and enforce separation of concerns.

## ✨ Key Features
* **Automated Provisioning:** End-to-end infrastructure deployment using Terraform modules.
* **Network Isolation:** Custom VPC and subnets to ensure secure network boundaries.
* **Scalable Compute:** Configured GKE node pools optimized for stateless and stateful workloads.
* **State Management:** Remote Terraform state configuration for team collaboration and locking.

## 🚀 Getting Started

### Prerequisites
* [Terraform](https://developer.hashicorp.com/terraform/downloads) (v1.0.0+)
* [Google Cloud CLI (`gcloud`)](https://cloud.google.com/sdk/docs/install)
* Active GCP Account with required IAM permissions.

### Deployment Workflow
1. **Authenticate to GCP:**
```bash
   gcloud auth application-default login
   gcloud config set project <YOUR_PROJECT_ID>
   ```

2. **Initialize Terraform:**
```bash
   terraform init
   ```

3. **Review Execution Plan:**
```bash
   terraform plan -out=tfplan
   ```

4. **Apply Infrastructure:**
```bash
   terraform apply tfplan
   ```

## 🔗 Ecosystem Repositories
* **Infrastructure Provisioning (Current):** `my-python-app-infra`
* **Application Source Code & CI:** [`my-python-app`](https://github.com/marioscloud/my-python-app)
* **GitOps State & CD:** [`my-python-app-gitops`](https://github.com/marioscloud/my-python-app-gitops)
````
