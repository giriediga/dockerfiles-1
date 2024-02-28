terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.38.0" # AWS provider version, not terraform version
    }
  }

  backend "s3" {
    bucket         = "giri.mybucket" # this is your bucket name
    key            = "ec2"           # you can give any key ex, foreach
    region         = "us-east-1"
    dynamodb_table = "giri-locking" # this is your dynamoDb table locking name
  }                                 # keeping empty flower bracket here = terraform understand that we are using S3 bucket here but actual keys are in backend.tf 
}

provider "aws" {
  region = "us-east-1"
}