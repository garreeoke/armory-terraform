resource "google_compute_instance_template" "tpl" {
  name         = "blazer1"
  machine_type = "n1-standard-1"

  disk {
    source_image = "debian-cloud/debian-9"
    auto_delete  = true
    disk_size_gb = 10
    boot         = true
  }

  network_interface {
    network = "default"
  }

  metadata = {
    app = "blazer"
  }

  can_ip_forward = true
}
