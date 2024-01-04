terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.10.0"
    }
  }
}

provider "google" {
  project     = "level-district-407913" // your project id
  region      = "asia-southeast2"
  credentials = "/home/sofyan/Desktop/devops/terraform/credentials.json" // your credentials file path
}
