provider "google" {
  credentials = "key.json" #service account secrete key
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


# The default provider configuration; resources that begin with `aws_` will use
# # it as the default, and it can be referenced as `aws`.

# # Additional provider configuration for west coast region; resources can
# # reference this as `aws.west`.
# provider "google" {
#   alias  = "west"
#   region = "us-west-2"
# }
