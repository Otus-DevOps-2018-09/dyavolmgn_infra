provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source          = "../modules/app"
  public_key_path = "${var.public_key_path}"
  zone            = "${var.zone}"
  app_disk_image  = "${var.app_disk_image}"
}

module "db" {
  source          = "../modules/db"
  public_key_path = "${var.public_key_path}"
  zone            = "${var.zone}"
  db_disk_image   = "${var.db_disk_image}"
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["0.0.0.0/0"]
}

#resource "google_compute_instance" "app" {
#  name         = "reddit-app"
#  machine_type = "g1-small"
#  zone         = "${var.zone}"
#  tags         = ["reddit-app"]


#  boot_disk {
#    initialize_params {
#      image = "${var.disk_image}"
#    }
#  }


#  network_interface {
#    network = "default"


#    access_config = {
#      nat_ip = "${google_compute_address.app_ip.address}"
#    }
#  }


#  metadata {
#    ssh-keys = "appuser:${file(var.public_key_path)}appuser1:${file(var.public_key_path)}appuser2:${file(var.public_key_path)}"
#  }


#  connection {
#    type        = "ssh"
#    user        = "appuser"
#    agent       = false
#    private_key = "${file(var.private_key_path)}"
#  }


#  provisioner "file" {
#    source      = "files/puma.service"
#    destination = "/tmp/puma.service"
#  }


#  provisioner "remote-exec" {
#    script = "files/deploy.sh"
#  }
#}


#resource "google_compute_firewall" "firewall_puma" {
#  name = "allow-puma-default"


#  network = "default"


#  allow {
#    protocol = "tcp"
#    ports    = ["9292"]
#  }


#  source_ranges = ["0.0.0.0/0"]


#  target_tags = ["reddit-app"]
#}


#resource "google_compute_firewall" "firewall_ssh" {
#  name        = "default-allow-ssh"
#  network     = "default"
#  description = "manual firewall ssh"


#  allow {
#    protocol = "tcp"
#    ports    = ["22"]
#  }


#  source_ranges = ["0.0.0.0/0"]
#}


#resource "google_compute_address" "app_ip" {
#  name = "reddit-app-ip"
#}

