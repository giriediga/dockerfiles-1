resource "aws_instance" "web" {
  ami           = "ami-0f3c7d07486cad139" #devops-practice
  instance_type = "t2.micro"

  tags = {
    Name = "provisioner"
  }
  provisioner "local-exec" {
    command = "echo this will execute at the time of creation, you can trigger other system linke email and sending alerts"
  }


  provisioner "local-exec" {
    command = "echo the server IP is ${self.private_ip} > inventory"
    on_failure = fail # it is to stop process if any failure occers
  }
  

# provisioner "local-exec" {
#   command = "ansible-playbook -i inventory web.yaml"
# }     # # this code to integrate terraform with ansible but it won’t work here as we don't have an ansible playbook. when we have ansible in linux server this code will work


 provisioner "local-exec" {
    command = "echo this will execute at the time of destroyyy, you can trigger other system linke email and sending alerts"
    when = destroy
  } 

}
  