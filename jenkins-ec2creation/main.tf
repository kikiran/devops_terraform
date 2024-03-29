resource "aws_instance" "jenkins-instance" {
    ami = "jenkins-instance"
    instance_type = "t2.micro"
    key_name = "custinstance"
    tags = {
      Name: "Jenkins instance"
    }
}