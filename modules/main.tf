
provider "google" {
  credentials = "key.json" 
  project     = "tensile-rite-392704"
  region  = "us-central1"
  zone    = "us-central1-c"
}

module "module-1" {
  source = "./module-1"
  
}

module "module-2" {
  source = "./module-2"
  
}