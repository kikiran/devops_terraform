data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}

# not recomanded 

data "aws_security_group" "dev" {
  id = "sg-011c5fe9842a1312d" #here change your sg id details"

}
data "aws_subnet" "dev" {
  id = "subnet-0303a91fcb3132734" #here chnage your subnet id details
}