
provider "google" {
  credentials = "key.json" 
  project     = "tensile-rite-392704"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-micro"
  

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

output "subnet-instance" {
  value = google_compute_instance.vm_instance.instance_id
}