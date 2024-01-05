project = "level-district-407913"
region  = "asia-southeast2"
zone    = "asia-southeast2-a"

name                    = "vm-test"
machine_type            = "e2-micro"
tags                    = ["fw-test"]
image                   = "ubuntu-os-cloud/ubuntu-2204-jammy-v20231213a"
disk_type               = "pd-ssd"
disk_size               = 10
network                 = "default"
subnetwork              = "default"
metadata_startup_script = <<EOF
  #!/bin/bash
  apt update -y && sudo apt upgrade -y
  sudo apt install nginx -y
EOF
