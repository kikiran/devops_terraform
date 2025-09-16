variable "ami_id" {
    description = "This is ami value for the aws instance"
    type = string
    default = ""
}

variable "instance_type" {
    description = "This is instance type for aws instance"
    type = string
    default = ""
}

variable "tags" {
    description = "Providing name tags for instance"
    type = string
    default = ""
  
}

variable "aws_s3_bucket" {
    description = "Providing name for the s3 bucket"
    type = string
  
}