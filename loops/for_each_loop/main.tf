
provider "google" {
  credentials = "key.json" #service account secrete key
  project     = "tensile-rite-392704"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  for_each = var.instance-name
  name         = "terraform-instance-${each.value}"
  machine_type = "e2.micro"

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
  type = set(string)#for_each argument must be a map, or set of strings
  description = "names of instances"
  default = [ "niteesh","satya","sai" ]
  
}