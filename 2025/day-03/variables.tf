variable "region" {
    description = "Passing aws region to main.tf"
    type = string
    default = ""
}

variable "aws_s3_bucket" {
    description = "Passing S3 bucket to the main.tf"
    type = string
    default = ""
}