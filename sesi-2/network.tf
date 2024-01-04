resource "google_compute_network" "vpc-app" {
  name                    = "vpc-app"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet-app-fe" {
  name          = "subnet-app-fe"
  ip_cidr_range = "10.2.0.0/24"
  region        = "asia-southeast2"
  network       = google_compute_network.vpc-app.name
}

resource "google_compute_subnetwork" "subnet-app-be" {
  name          = "subnet-app-be"
  ip_cidr_range = "10.3.0.0/24"
  region        = "asia-southeast2"
  network       = google_compute_network.vpc-app.name
}
