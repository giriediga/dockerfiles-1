output "instance_id" { 

    value = aws_instance.web.id # .id to get instance id of the instance
}

output "public-ip" { 

    value = aws_instance.web.public_ip # .public_ip to get instance public ip of the instance
}

output "private-ip" { 

    value = aws_instance.web.private_ip # .private_ip to get instance private ip of the instance
}
