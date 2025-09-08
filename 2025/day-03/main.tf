provider "aws" {
    region = var.region
  
}

resource "aws_s3_bucket" "dev" {
    bucket = var.aws_s3_bucket
}