terraform {
  backend "gcs" {
    bucket  = "aaront-armory-tf-state"
    prefix  = "terraform/state"
    credentials = "/home/spinnaker/.google/gcp.json"
  }
}

provider "google" {
  credentials = file("/home/spinnaker/.google/gcp.json")
  project = "aaront1"
  region  = "us-central1"
  zone    = "us-central1-a"
}

variable "environment_name" {
  default="acme-tester"
}

resource "google_compute_instance_from_template" "blaze-instance" {
  name         = "acmetester"
  zone = "us-central1-a"
  source_instance_template = "blaze-instance"
  can_ip_forward = false
}
