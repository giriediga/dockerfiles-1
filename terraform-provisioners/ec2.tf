resource "aws_instance" "webgiri" {
  ami           = "ami-0f3c7d07486cad139" #devops-practice
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.roboshop-all.id]

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
    # when = destroy
  } 

connection {
  type = "ssh"
  user = "centos"
  password = "DevOps321"
  host = self.public_ip
}

provisioner "remote-exec" {
    inline = [
      "echo 'this is from remote exec' > /tmp/remote.txt",
      "sudo yum install nginx -y",
      "sudo systemctl start nginx"
  ] 
  }
}

resource "aws_security_group" "roboshop-all" { #this is terraform name, for terraform reference only
    name        = "provisioner"
    

    ingress {
        description      = "Allow All ports"
        from_port        = 22 # 0 means all ports
        to_port          = 22 
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    } 

ingress {
        description      = "Allow All ports"
        from_port        = 80 # to run nginx from outside you should have opened port number 80
        to_port          = 80 
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    } 
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        
    }

    tags = {
        Name = "Remote-Exec"
    }

  
}

  