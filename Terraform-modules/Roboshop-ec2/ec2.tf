module "roboshop_ec2" {
  source = "../module-ec2"  # using the source of one step back folder (module-ec2). terraform will check the source code in the module-ec2 folder and excite all the files.
  instance_type = var.instance_typeeeeee
  tags = var.tagssssss
}