terraform {
  backend "gcs" {
    bucket = "terraform-asofdevlabs"
    prefix = "terraform/state/vpc/vpc-stagging"
  }
}
module "test-module" {
  source = "../../../../module/gcp/vpc"

  project     = "level-district-407913"
  region      = "asia-southeast2"
  zone        = "asia-southeast2-a"
  credentials = "/home/sofyan/Desktop/DEVOPS/terraform/credentials.json"

  name                    = "vpc-stagging"
  auto_create_subnetworks = false
  ip_cidr_range           = "192.168.91.0/24"
}
