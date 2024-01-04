provider "google" {
  project = "level-district-407913"
  region  = "asia-southeast2"
}

resource "google_compute_instance" "default" {
  name         = "testing" 
  machine_type = "e2-medium"
  zone         = "asia-southeast2-b"

  tags = ["frontend", "nextjs"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size = 12
      type = "pd-ssd"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}
