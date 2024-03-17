provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "dev" {
  ami = "ami-03f4878755434977f"
  instance_type = "t3.micro"
}