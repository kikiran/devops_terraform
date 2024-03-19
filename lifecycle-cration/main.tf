provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "dev" {
  ami = "ami-0d7a109bf30624c99"
  instance_type = "t2.micro"
  key_name = "custinstance"
  
  tags = {
    Name = "dev"
  }

  #lifecylce methods
  
  lifecycle {
    create_before_destroy = true
  }
  # lifecycle {
#   prevent_destroy = true    #Terraform will error when it attempts to destroy a resource when this is set to true:
# }


#   lifecycle {
#     ignore_changes = [tags,] #This means that Terraform will never update the object but will be able to create or destroy it.
#   }

}

