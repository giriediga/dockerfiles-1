# this code is to reed vpc_id that is stored in SSM parameter
data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/vpc_id"
}

# data "aws_vpc" "default" {
#   default = true
# }