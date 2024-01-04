data "google_compute_network" "vpc-default" {
  name = "default"
}

resource "google_compute_subnetwork" "extra-subnet" {
  name          = "extra-subnet"
  network       = data.google_compute_network.vpc-default.id
  ip_cidr_range = "10.10.0.0/24"
  region        = "asia-southeast2"
}
