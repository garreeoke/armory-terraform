provider "google" {
  credentials = file("/home/spinnaker/.google/gcp.json")
  project = "aaront-armory1"
  region  = "us-west1"
  zone    = "us-west1-b"
}

variable "environment_name" {
  default="acme-tester"
}

resource "google_compute_instance" "blaze-instance" {
  name         = "${var.environment_name}"
  machine_type = "n1-standard-1"

  boot_disk {
    initialize_params {
      image = "blaze-image1"
    }
  }
  network_interface {
    network = "default"
  }

  metadata = {
    app = "blazer"
  }

  can_ip_forward = true
}