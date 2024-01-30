resource "aws_instance" "web" {
  ami           = "ami-0f3c7d07486cad139" #devops-practice
  instance_type = "t2.micro"

  tags = {
    Name = "provisioner"
  }

  provisioner "local-exec" {
    command = "echo the server IP is ${self.private_ip} > inventory"
  }
  }
# provisioner "local-exec" {
#   command = "ansible-playbook -i inventory web.yaml"
# }
  
  