provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "dev" {
  ami = "ami-0d7a109bf30624c99"
  instance_type = "t2.micro"
  key_name = "custinstance"
}

resource "aws_s3_bucket" "dev" {
  bucket = "dependbucket"
  depends_on = [ aws_instance.dev ] #pass whole aws instance into dependency
  
}