variable "ami_id" {
  description = "passing ami_id to main.tf"
  type = string
  default = ""
}
variable "instance_type" {
  description = "describe ec2 type"
  type = string
  default = ""
}
variable "key_name" {
  description = "passing keypair to main.tf"
  type = string
  default = ""
}