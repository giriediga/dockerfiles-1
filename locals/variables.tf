variable "instance_names" {
  type = list
  default = ["mongodb","redis","mysql","rabbitmq","catalogue","user","cart","shipping","payment","dispatch","web"]
}

variable "ami_id" {
  default = "ami-081609eef2e3cc958"
}

variable "zone_id" {
  default = "Z103478124Q9INV2H00D2" # zone id is a cheracterstic of ur domain. we copy zone id value from domain cheracterstic
}

variable "domain_name" {
  default = "ardai.online"
}