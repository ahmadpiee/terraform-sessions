terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.10.0"
    }
  }
}

provider "google" {
  project     = var.project // your project id
  region      = var.region
  zone        = var.zone
  credentials = var.credentials // your credentials file path
}
