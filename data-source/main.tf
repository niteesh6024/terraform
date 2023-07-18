provider "google" {
  credentials = "key.json" 
  project     = "tensile-rite-392704"
  region  = "us-central1"
  zone    = "us-central1-c"
}


data "google_compute_instance" "instance_info" {
  name = var.instance_name
  depends_on = [ google_compute_instance.vm_instance ]
  
}

resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
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

output "print_ip" {
  value = data.google_compute_instance.instance_info.network_interface[0].access_config[0].nat_ip

}