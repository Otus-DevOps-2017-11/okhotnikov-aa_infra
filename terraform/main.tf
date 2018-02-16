provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "f1-micro"
  zone         = "europe-west4-b"
  tags         = ["reddit-app"]

  # boot disk
  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  # network int
  network_interface {
    network       = "default"
    access_config = {}
  }

  # add ssh keys to metadata
  metadata {
    sshKeys = "appuser:${file("/home/alex/.ssh/appuser.pub")}"
  }

  connection {
    type        = "ssh"
    user        = "appuser"
    agent       = false
    private_key = "${file("/home/alex/.ssh/appuser")}"
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.sevice"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}

resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"

  # network where rule 
  network = "default"

  # what to allow
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  # ips to allow
  source_ranges = ["0.0.0.0/0"]

  # rule for intances with tags
  target_tags = ["reddit-app"]
}
