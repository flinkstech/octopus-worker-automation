resource "google_service_account" "default" {
  account_id   = "test-sa-spot-vm-creation"
  display_name = "Service Account"
}

resource "google_compute_instance" "default" {
  name         = var.vm_name #"test-spot-vm"
  machine_type = var.vm_type #"e2-medium"
  zone         = var.vm_zone #"us-central1-a"
  tags = ["octopus"]

  boot_disk {
    initialize_params {
      image = var.vm_img #"debian-cloud/debian-11"
    }
  }
    scheduling {
    preemptible       = true
    automatic_restart = false
    provisioning_model = "SPOT"
  }


  // Local SSD disk
#   scratch_disk {
#     interface = "SCSI"
#   }

  network_interface {
    network = var.vm_network #"default"

    access_config {
      // Ephemeral public IP
    }
  }

#   metadata = {
#     foo = "bar"
#   }

#   metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}