provider "google" {
  credentials = "key.json" #service account secrete key
  project     = "tensile-rite-392704"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  count = length(var.instance-name)
  name         = "terraform-instance-${var.instance-name[count.index]}"
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

variable "instance-name" {
  type = list(string)
  description = "names of instances"
  default = [ "nitees","satya","sai" ]
  
}