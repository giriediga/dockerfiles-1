variable "instance_names" {
  type = map
  # default = {
  #   # mongodb = "t3.small"
  #   # redis = "t2.micro"
  #   # mysql = "t3.small"
  # }
}

variable "zone_id" {
  default = "Z103478124Q9INV2H00D2" # zone id is a cheracterstic of ur domain. we copy zone id value from domain cheracterstic
}

variable "domain_name" {
  default = "ardai.online"

} 