terraform {
  backend "gcs" {
    bucket  = "aaront-armory-tf-state"
    prefix  = "terraform/state"
    credentials = "/home/spinnaker/.google/gcp.json"
  }
}

provider "google" {
  credentials = file("/home/spinnaker/.google/gcp.json")
  project = "aaront-armory1"
  region  = "us-west1"
  zone    = "us-west1-b"
}

variable "environment_name" {
  default="acme-tester"
}

resource "google_compute_instance_from_template" "blaze-instance" {
  name         = "acmetester"
  zone = "us-west1-b"
  source_instance_template = "bzt-instance-template"
  can_ip_forward = false
}