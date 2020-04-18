provider "google" {
  credentials = file("/home/spinnaker/.google/spinnaker-gcs.json")
  project = "aaront-armory1"
  region  = "us-west1"
  zone    = "us-west1-b"
}

resource "google_compute_instance" "blaze-instance" {
  name         = "instance-from-image"
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
