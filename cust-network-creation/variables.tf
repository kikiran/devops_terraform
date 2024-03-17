variable "ami_id" {
  description = "Passing AMI_ID to maint.tf"
  type        = string
  default     = ""
}
variable "instance_type" {
  description = "pssing default instance type to the maint.tf"
  type        = string
  default     = ""

}
variable "keys" {
  description = "pssing default keys to the maint.tf"
  type        = string
  default     = ""

}
