resource "google_compute_instance" "vm-app-backend" {
  name         = "vm-app-backend"
  machine_type = "e2-medium"
  zone         = "asia-southeast2-a"

  tags = ["fw-app", "ssh-access"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-jammy-v20231213a"
      type  = "pd-ssd"
      size  = 10
      labels = {
        my_label = "ubuntu22amd64"
      }
    }
  }


  network_interface {
    network    = google_compute_network.vpc-app.name
    subnetwork = google_compute_subnetwork.subnet-app-be.name

    access_config {
      // Ephemeral public IP
    }
  }
  metadata = {
    ssh_keys = file("~/.ssh/id_rsa.pub")
  }

  metadata_startup_script = <<EOF
  #!/bin/bash
  apt update -y && sudo apt upgrade -y
  sudo apt install nginx -y

EOF
}


# 2
resource "google_compute_instance" "vm-app-fe" {
  name         = "vm-app-fe"
  machine_type = "e2-medium"
  zone         = "asia-southeast2-a"

  tags = ["fw-app", "ssh-access"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-jammy-v20231213a"
      type  = "pd-ssd"
      size  = 10
      labels = {
        my_label = "ubuntu22amd64"
      }
    }
  }


  network_interface {
    network    = google_compute_network.vpc-app.name
    subnetwork = google_compute_subnetwork.subnet-app-fe.name

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    ssh_keys = file("~/.ssh/id_rsa.pub")
  }

  metadata_startup_script = <<EOF
  #!/bin/bash
  apt update -y && sudo apt upgrade -y
  sudo apt install nginx -y

EOF
}

# be
output "ip-private-backend" {
  value = google_compute_instance.vm-app-backend.network_interface[*].network_ip
}
output "ip-public-backend" {
  value = google_compute_instance.vm-app-backend.network_interface[*].access_config[*].nat_ip
}

# fe
output "ip-private-fe" {
  value = google_compute_instance.vm-app-fe.network_interface[*].network_ip
}
output "ip-public-fe" {
  value = google_compute_instance.vm-app-fe.network_interface[*].access_config[*].nat_ip
}
