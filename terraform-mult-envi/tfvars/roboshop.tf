resource "aws_instance" "web" {
  for_each = var.instance_names
  ami           = data.aws_ami.centos8.id
  instance_type = each.value
  tags = {
    Name = each.key
  }
}


resource "aws_route53_record" "www" {
  for_each = aws_instance.web
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" #interpolation
  type    = "A"
  ttl     = 1
  records = [startswith(each.key, "web") ? each.value.public_ip : each.value.private_ip ] 
 } # condition, if each.key startswith web in different environments, it pick publicip as each.value otherwise it pick private ip as a each.value



# output "instances_info" {
#   value = aws_instance.web
# } # condition, if each.key is web it pick publicip as each.value otherwise it pick private ip as a each.value


# output "instances_info" {
#   value = aws_instance.web
# }

# each.key means when iteration (repetition) happens it picks each key like mongodb, web, mysql etc. from var.instance_names in variable.tf

# we are using startwith function with each.key: means, if each.key startswith web in different environments, it pick publicip as each.value otherwise it pick private ip as a each.value



  