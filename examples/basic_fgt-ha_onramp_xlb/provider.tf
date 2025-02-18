### GCP terraform for HA setup
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.48.0"
    }
  }
}
provider "google" {
  project      = var.project
  region       = var.region
  zone         = var.zone1
  access_token = var.token
}
provider "google-beta" {
  project      = var.project
  region       = var.region
  zone         = var.zone1
  access_token = var.token
}

