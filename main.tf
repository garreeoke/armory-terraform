provider "google" {
  project = "aaront-armory1"
  region  = "us-west1"
  zone    = "us-west1-b"
}

resource "google_compute_instance_from_template" "blazer-template" {
  name         = "instance-from-template"
  source_instance_template = "blazer-template"

  network_interface {
    network = "default"
  }

  metadata = {
    app = "blazer"
  }

  can_ip_forward = true
}
