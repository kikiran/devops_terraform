terraform {
  backend "s3" {
    bucket = "terraform-20240314063729088900000001"
    key    = "custinstance"
    region = "us-east-1"
    dynamodb_table = "aws_dynamodb_table_state_lock"
    encrypt = true
   
  }
}