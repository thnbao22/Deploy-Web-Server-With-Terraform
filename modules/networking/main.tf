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
  
}