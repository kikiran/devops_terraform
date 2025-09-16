module "development" {
    source = "./modules/ec2_instance"
    ami_id = "ami-00ca32bbc84273381"
    instance_type = "t2.micro"
    aws_s3_bucket = "my-terraform-bucket009"
   
}