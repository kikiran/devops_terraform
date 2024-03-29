resource "aws_instance" "jenkins-instance" {
    ami = "ami-0c101f26f147fa7fd"
    instance_type = "t2.micro"
    key_name = "custinstance"
    tags = {
      Name: "Jenkins instance"
    }
}