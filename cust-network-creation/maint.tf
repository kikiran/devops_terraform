#create custom network with terraform

#create vpc with terraform
resource "aws_vpc" "dev" {
  tags = {
    Name: "devvpc",
  }
  cidr_block = "10.0.0.0/16"
}

#create InternetGateway with terraform
resource "aws_internet_gateway" "dev" {
  vpc_id = aws_vpc.dev.id
  tags = {
    Name: "devig",
  }
    
}
#create subnet using terraform
resource "aws_subnet" "dev" {
  vpc_id = aws_vpc.dev.id
  cidr_block = "10.0.0.0/24"
}
#create route table & attach internet gateway using terraform
resource "aws_route_table" "dev" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev.id
  }
}

#create subnet assocaitions for route and subnet
resource "aws_route_table_association" "dev" {
  route_table_id = aws_route_table.dev.id
  subnet_id = aws_subnet.dev.id  
}

#create eip id
resource "aws_eip" "dev" {
  
}

#create NAT Gateway assocaitions for route and allocation

resource "aws_nat_gateway" "dev" {
  allocation_id = aws_eip.dev.id
  subnet_id = aws_subnet.dev.id
  tags = {
    Name = "mynatgateway",
  }
}