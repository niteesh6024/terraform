provider "google" {
  credentials = "key.json" #service account secrete key
  project     = "tensile-rite-392704"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  count = var.count-instance #it iterate over the resource i.e 0,1,2....
  name         = "terraform-instance-${count.index}"
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}

