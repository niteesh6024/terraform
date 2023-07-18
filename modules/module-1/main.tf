
provider "google" {
  credentials = "key.json" 
  project     = "tensile-rite-392704"
  region  = "us-central1"
  zone    = "us-central1-c"
}


resource "google_compute_instance" "example_instance" {
  name         = "instance-module-1"
  machine_type = "e2-micro"


  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    service nginx start
    echo "<html><body><h1>Hello this is module-1  </h1></body></html>" > /usr/share/nginx/html/index.html
  EOF
}

