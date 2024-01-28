resource "aws_security_group" "roboshop-all" { 
    name        = "dynamic-demo"
    description = "dynamic-demo"

    dynamic ingress {
        for_each = var.ingress_rules # 1
        content {
          description      = ingress.value["description"]
          from_port        = ingress.value["from_port"]
          to_port          = ingress.value["to_port"]
          protocol         = ingress.value["protocol"]
          cidr_blocks      = ingress.value["cidr_blocks"]
        }     # 2 content block
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        #ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "dynamic-demo-1"
    }
}

# we creating security group enabling multiple ports using dynamic blocks 
#  Dynamic Blocks: Is useful when a particular block within the configuration of a resource repeats repeatedly.

# we like to enable multiple ports (port no 80, 443 and 22) using dyanmic loop to avoid repeated configuration.

# 1: we write for_each (var.ingress_rules) to repeat the information inside (2) content block
# first it repeats the info of port 80 and then port 443 and so on 

# We don't use this dynamic block much but it is good to understand
