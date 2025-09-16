output "load_balancer_arn" {
  description = "value of the load balancer DNS Name"
  value = aws_lb.web_app_alb.dns_name  
}


output "batman_instance_public_ip" {
  description = "The public IP of the Batman EC2 instance"
  value       = aws_instance.web_app_batman_instance.public_ip
}

output "ironman_instance_public_ip" {
  description = "The public IP of the Ironman EC2 instance"
  value       = aws_instance.web_app_ironman_instance.public_ip
}

output "web_app_vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.web_app_vpc.id
}