variable "region" {
  description = "Passing region to AWS provider value to main.tf"
  type = string
  default = ""
}

variable "ami_id" {
    description = "Passing ami_id value to main.tf"
    type = string
    default = ""
  
}

variable "instance_type" {
    description = "Passing instance_type value to main.tf"
    type = string
    default = ""
}

