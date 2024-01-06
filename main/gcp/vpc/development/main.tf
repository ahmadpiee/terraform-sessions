module "test-module" {
  source = "../../../../module/gcp/vpc"

  project     = "level-district-407913"
  region      = "asia-southeast2"
  zone        = "asia-southeast2-a"
  credentials = "/home/sofyan/Desktop/DEVOPS/terraform/credentials.json"

  name                    = "vpc-development"
  auto_create_subnetworks = false
  ip_cidr_range           = "192.168.90.0/24"
}
