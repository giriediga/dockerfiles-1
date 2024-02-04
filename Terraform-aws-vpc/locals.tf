# Creating locals for keeping repeated variables within the locals.tf 
locals {
  name = "${var.project_name}-${var.environment}"
  # az_names = slice(data.aws_availability_zones.azs.names,0,2)
}