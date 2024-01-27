resource "aws_instance" "web" {
  #count = 11 # count.index is a special variable given by terraform
  count = length(var.instance_names) 
  ami           = var.ami_id #devops-practice
  instance_type = var.instance_names[count.index] == "mongodb" || var.instance_names[count.index] == "mysql" || var.instance_names[count.index] == "shipping" ? "t3.small" : "t2.micro"
  tags = {
    Name = var.instance_names[count.index]
  }
}

resource "aws_route53_record" "www" {
  # count = 11
  count = length(var.instance_names)
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.${var.domain_name}" #interpolation
  type    = "A"
  ttl     = 1
  records = [var.instance_names[count.index] == "web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip]
}

# count = "number" ex count = 11 , downside - it create all instances with same name ex, web

# count.index is a special variable given by terraform, it creates all instances available in the list with respective names.  When a record created after executive command, First time 0 will come, it takes the zone ID and from it mongodb.ardai.online will come And then A will be created.And this A record need private ip so, it will take private ip (as input) from the output of count 11( first starts with 0, that is mangodb private ip), of the resource "aws_instance" "web Then it starts with 1 that is redis. It takes the private ip of redis… so on…


# count = length{var.instance_names} instead count = 11 (for 11 instances. length function works even if you remove or add any name (instance)

# || this is for "or" 

# $ When you use both variable and static together, you need to give $ before variable and {} to variable. Ex, ${var.instance_names[count.index]} , ${var.domain_name} etc.

