variable "machine_type" {
  type = string
  default = "e2-micro"
  description = "this is the varible for e2-micro"
}

variable "count-instance" {
  type = number
  default = 2
  description = "this is the varible for number of repilicas"
}