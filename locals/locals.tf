# locals {
#   name = "sivakumar"
#   training = "terraform"
#   instance_type = var.instance_names[count.index] == "mongodb" || var.instance_names[count.index] == "mysql" || var.instance_names[count.index] == "shipping" ? "t3.small" : "t2.micro" # condition: t3.small for mongoDB, mysql and shipping and t2.micro for rest of the servers.

#   ip = [var.instance_names[count.index] == "web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip] # it is condition: pubilc ip for Web sever and private ip for rest of the servers
# }

locals {
  name = "sivakumar"
  training = "terraform"
  instance_type = var.instance_names[count.index] == "mongodb" || var.instance_names[count.index] == "mysql" || var.instance_names[count.index] == "shipping" ? "t3.small" : "t2.micro"
  ip = var.instance_names[count.index] == "web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip
}