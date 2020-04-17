provider "google" {
  project = "aaront-armory1"
  region  = "us-west1"
  zone    = "us-west1-b"
}

resource "google_compute_instance_template" "blazer-template" {
  name         = "blazer1"
  machine_type = "n1-standard-1"

  network_interface {
    network = "default"
  }

  metadata = {
    app = "blazer"
  }

  can_ip_forward = true
}
