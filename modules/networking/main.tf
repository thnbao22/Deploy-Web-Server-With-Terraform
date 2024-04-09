resource "aws_vpc" "prod" {
  cidr_block            = "10.10.0.0/16"
  enable_dns_hostnames  = true
  enable_dns_support    = true
  tags = {
    "Name" = "charlesVPC" 
  }
}   

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.prod.id
  cidr_block = "10.10.1.0/24"
  availability_zone = "ap-southeast-1a"
  tags = {
    "Name" = "Public Subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.prod.id
  tags = {
    "Name" = "CharlesIGW"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.prod.id
  tags = {
    "Name" = "Public Route Table"
  }
}

resource "aws_route" "public_route" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}

# Define local values for port
locals {
  # HTTP
  port_in_80    = [
    80
  ]
  # SSH
  port_in_22    = [
    22
  ]
  # HTTPS
  port_in_443   = [  
    443
  ]
}

# SG for Web Server
resource "aws_security_group" "web_server_sg" {
 name = "Public Security Group"
 description = "Allow Web inbound traffic"
 vpc_id = aws_vpc.prod.id
 dynamic "ingress" {
   for_each = toset(local.port_in_22)
   content {
     from_port = ingress.value
     to_port = ingress.value
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }
 }
 dynamic "ingress" {
   for_each = toset(local.port_in_80)
   content {
     from_port = ingress.value
     to_port = ingress.value
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }
 }
 dynamic "ingress" {
   for_each = toset(local.port_in_443)
   content {
     from_port = ingress.value
     to_port = ingress.value
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }
 }
}