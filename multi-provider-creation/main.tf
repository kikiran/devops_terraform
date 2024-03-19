#provider 1
provider "aws" {
  region = "us-east-1"
}

#provider 2
provider "aws" {
  region = "ap-south-1"
  alias = "india"
}

#provider 1 s3 bucket creation request
resource "aws_s3_bucket" "provider1" {
  bucket = "provider1-bucket"
}

#provider 2 s3 bucket creation request passing the alias
resource "aws_s3_bucket" "provider2" {
  bucket = "provider2-bucket"
  provider = aws.india # here we have to pass provider alias value
}