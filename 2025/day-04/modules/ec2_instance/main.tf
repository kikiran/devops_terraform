provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "development" {
  ami = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name: var.tags
  }
}

resource "aws_s3_bucket" "my_terraform_bucket" {
  bucket = var.aws_s3_bucket
}