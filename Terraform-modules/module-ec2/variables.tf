variable "ami" {
  default = "ami-0f3c7d07486cad139"
  type = string
}

variable "instance_type" {
  default = "t2.micro"
  type = string
}

variable "tags" {
  default = {}
  type = map
}