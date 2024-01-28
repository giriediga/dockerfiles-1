terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0" # AWS provider version, not terraform version
    }
  }

   backend "s3" {
    bucket = "ardaimys3bucket" # this is your bucket name
    key    = "foreach" # you can give any key ex, foreach
    region = "us-east-1"
    dynamodb_table = "adrai-locking" # this is your dynamoDb table locking name
  }
}

provider "aws" {
  region = "us-east-1"
}