provider "aws" {
  region = "us-east-1"
  profile = "dev"
}

# vpc creation
resource "aws_vpc" "web_app_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "web_app_vpc"
  }
}

# subnet 1 creation
resource "aws_subnet" "web_app_subnet1" {
  vpc_id            = aws_vpc.web_app_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}

# subnet 2 creation
resource "aws_subnet" "web_app_subnet2" {
  vpc_id            = aws_vpc.web_app_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
}

# internet gateway creation
resource "aws_internet_gateway" "web_app_igw" {
  vpc_id = aws_vpc.web_app_vpc.id
  tags = {
    Name = "web_app_igw"
  }
}

# route table creation
resource "aws_route_table" "web_app_rt" {
  vpc_id = aws_vpc.web_app_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web_app_igw.id
  }
  tags = {
    Name = "web_app_rt"
  }
}

# route table association for subnet 1
resource "aws_route_table_association" "web_app_rta1" {
  subnet_id      = aws_subnet.web_app_subnet1.id
  route_table_id = aws_route_table.web_app_rt.id
}

# route table association for subnet 2
resource "aws_route_table_association" "web_app_rta2" {
  subnet_id      = aws_subnet.web_app_subnet2.id
  route_table_id = aws_route_table.web_app_rt.id
}

# security group creation
resource "aws_security_group" "web_app_sg" {
  name        = "web_app_sg"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = aws_vpc.web_app_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "web_app_sg"
  }
}


# EC2 instance creation
resource "aws_instance" "web_app_batman_instance" {
  ami                    = var.ami_id_batman
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.web_app_subnet1.id
  vpc_security_group_ids = [aws_security_group.web_app_sg.id]
  tags = {
    Name = "batman-app"
  }

  user_data = base64decode(filebase64("batman.sh"))
}


# EC2 instance creation
resource "aws_instance" "web_app_ironman_instance" {
  ami                    = var.ami_id_ironman
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.web_app_subnet2.id
  vpc_security_group_ids = [aws_security_group.web_app_sg.id]
  tags = {
    Name = "ironman-app"
  }

  user_data = base64decode(filebase64("ironman.sh"))
}


#auto scaling group and launch configuration
resource "aws_lb" "web_app_alb" {
  name               = "web-app-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_app_sg.id]
  subnets            = [aws_subnet.web_app_subnet1.id, aws_subnet.web_app_subnet2.id]
  tags = {
    Name = "web_app_alb"
  }


}

#create target group

resource "aws_lb_target_group" "web_app_tg" {
  name     = "web-app-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.web_app_vpc.id
  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"
  }
  tags = {
    Name = "web_app_tg"
  }
}

#attach target group to load balancer
resource "aws_lb_listener" "web_app_listener" {
  load_balancer_arn = aws_lb.web_app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_app_tg.arn
  }
} 

#register instances with target group
resource "aws_lb_target_group_attachment" "batman_attachment" {
  target_group_arn = aws_lb_target_group.web_app_tg.arn
  target_id        = aws_instance.web_app_batman_instance.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "ironman_attachment" {
  target_group_arn = aws_lb_target_group.web_app_tg.arn
  target_id        = aws_instance.web_app_ironman_instance.id
  port             = 80
}

