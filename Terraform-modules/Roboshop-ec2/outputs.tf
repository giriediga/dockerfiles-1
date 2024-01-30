output "public" {
  value = module.roboshop_ec2.public_ip  
} 

output "private" {
  value = module.roboshop_ec2.private_ip
}

# value = module.roboshop_ec2.public_ip 
# module = aws defination that you used in ec2.tf with roboshop-ec2 folder
# roboshop_ec2 = your defination that you gave in ec2.tf with roboshop-ec2 folder
# public_ip and private_ip are from outputs.tf within module.tf