resource "google_compute_instance" "vm-app" {
  name         = "vm-app"
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
  sudo apt update -y && sudo apt upgrade -y
  sudo apt install software-properties-common curl apt-transport-https ca-certificates -y
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt install docker-ce docker-ce-cli containerd.io uidmap -y
  sudo usermod -aG docker $USER
  newgrp docker
  sudo systemctl status docker
  sudo systemctl enable docker

  # Run nginx container
  docker run -d -p 80:80 --name nginx nginx
EOF


}
