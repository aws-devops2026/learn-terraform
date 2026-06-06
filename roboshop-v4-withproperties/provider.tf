# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "b60-s3-for-terraform"
    key    = "expense-v1/terraform.tfstate"
    region = "us-east-1"
  }
}