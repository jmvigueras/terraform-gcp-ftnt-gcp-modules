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
  region = var.region
}
provider "google-beta" {
  region = var.region
}

