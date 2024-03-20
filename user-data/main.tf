provider "aws" {
  region = "us-east-1"
  
}

resource "aws_instance" "dev" {
  ami = "ami-0d7a109bf30624c99"
  instance_type = "t2.micro"
  key_name = "custinstance"
  user_data = file("creation.sh")
  tags ={
    Name = "Project Creation"
  }
  
}