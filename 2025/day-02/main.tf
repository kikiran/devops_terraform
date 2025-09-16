provider "aws" {
    region = var.region
}

resource "aws_instance" "dev" {
   ami = var.ami_id
   instance_type = var.instance_type
}