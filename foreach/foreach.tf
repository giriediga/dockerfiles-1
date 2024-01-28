resource "aws_instance" "web" {
  for_each = var.instance_names
  ami           = var.ami_id #devops-practice
  instance_type = each.value 
  tags = {
    Name = each.key
  } 
}

# resource "aws_route53_record" "www" {
#   #count = 11
#   count = length(var.instance_names)
#   zone_id = var.zone_id
#   name    = "${var.instance_names[count.index]}.${var.domain_name}" #interpolation
#   type    = "A"
#   ttl     = 1
#   records = [var.instance_names[count.index] == "web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip]
# }

resource "aws_route53_record" "www" {
  for_each = aws_instance.web
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" #interpolation #each.key means web,mysql, shipping etc
  type    = "A"
  ttl     = 1
  records = [each.key == "web" ? each.value.public_ip : each.value.private_ip ] # condition, if each.key is web it pick publicip as each.value otherwise it pick private ip as a each.value
}

# output "instances_info" {
#   value = aws_instance.web
# }


# we are creating 11 instances using for.each loop, pulic_ip for web and private_ip for rest, t3.small for mongodb, mysql n shipping and t2.micro for rest

# each.value means when iteration (repetition) happens it picks each value like, t3.small, t2.micro etc from var.instance_names in variable.tf

# each.key means when iteration (repetition) happens it picks each key like mongodb, web, mysql etc. from var.instance_names in variable.tf
  