#Create VPC
resource "aws_vpc" "demo_vpc" {
 cidr_block = "10.0.0.0/16"
}

#Create Internet Gateway
resource "aws_internet_gateway" "igw"{
  vpc_id = aws_vpc.demo_vpc.id
}

# Create Public Subentes (2 availabilty zones)
resource "aws_subnet" "public_subnet_a" {
  vpc_id = aws_vpc.demo_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id = aws_vpc.demo_vpc.id
  cidr_block = "101.0.2.0/24"
  availability_zone = "us-west-2b"
  map_public_ip_on_launch = true
}

# Create Private Subnets( 2 Avaialabilty zones)
resource "aws_subnet" "private_subnet_a" {
  vpc_id = aws_vpc.demo_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-west-2a"
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id = aws_vpc.demo_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-west-2b"
}

# Create NAT gateways in both public subnets
resource "aws_eip" "nat_eip_a" {
  vpc = true
}

resource "aws_eip" "nat_eip_b" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw_a" {
  allocation_id = aws_eip.nat_eip_a.id
  subnet_id = aws_subnet.public_subnet_a.id
}

resource "aws_nat_gateway" "nat_gw_b" {
  allocation_id = aws_eip.nat_eip_b
  subnet_id = aws_subnet.public_subnet_b
}

# Route tables for Public and Private Subenets
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.demo_vpc.id

  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "aws_rt_assoc_a" {
  subnet_id = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "aws_rt_assoc_b" {
  subnet_id = aws_subnet.public_subnet_b
  route_table_id = aws_route_table.public_rt.id
}

# Private route tables with NAT gateways for private subnets
resource "aws_route_table" "aws_private_rt_a" {
  vpc_id = aws_vpc.demo_vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_a.id
  }
}

resource "aws_route_table" "aws_private_rt_b" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_b
  }
}

resource "aws_route_table_association" "private_rt_assoc_a" {
  subnet_id = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.aws_private_rt_a.id
}

resource "aws_route_table_association" "private_rt_assoc_b" {
  subnet_id = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.aws_private_rt_b.id
}

