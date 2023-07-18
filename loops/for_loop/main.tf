#[for s in var.list : expression]   to get output result as list
#{for s in var.list : key => value}   to get output result as object 

provider "google" {
  credentials = "key.json" #service account secrete key
  project     = "tensile-rite-392704"
  region  = "us-central1"
  zone    = "us-central1-c"
}

variable "instance-name" {
  type = set(number)
  description = "names of instances"
  default = [ 1,2,3]
  
}

locals {
  num = [for s in var.instance-name : s*s]
}

output "getting" {
  value = local.num[1]
}

output "printing_variables" {
  value = [for s in var.instance-name : s+s]
  
}

