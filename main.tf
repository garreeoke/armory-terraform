terraform {
  backend "gcs" {
    bucket  = "aaront-armory-tf-state"
    prefix  = "terraform/state"
  }
}

provider "google" {
  credentials = file("/home/spinnaker/.google/gcp.json")
  project = "aaront-armory1"
  region  = "us-west1"
  zone    = "us-west1-b"
  version = "~> 2.5.0"
}

variable "environment_name" {
  default="acme-tester"
}

resource "google_compute_instance" "blaze-instance" {
  name         = "acmetester"
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