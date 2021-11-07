provider "aws" {
  region = var.aws_region
}


terraform {


  backend "s3" {
    bucket = "terraform-aws-moise"
    key    = "test/project1/terraform.tfstate"
    region = "us-east-1"


    dynamodb_table = "test-project1-aws"
  }
}