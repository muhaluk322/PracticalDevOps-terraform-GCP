terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.16.0"
    }
  }
}

provider "google" {
  project = local.project_id
  region  = var.region
  zone    = var.zone
}