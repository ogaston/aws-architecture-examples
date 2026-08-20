# Internet VPC
# VPCs are virtual private clouds that you create in AWS. They are isolated from other virtual networks in the AWS cloud. You can launch your AWS resources, such as EC2 instances, into your VPC. You can also create subnets within your VPC to further isolate your resources.

resource "aws_vpc" "main-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }
}


# Subnet
# Subnets are segments of a VPC's IP range that you can allocate to resources

resource "aws_subnet" "main-subnet" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "main-public-subnet-2a"
  }
}


resource "aws_subnet" "main-private-subnet" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "main-private-subnet-2a"
  }
}


# Internet Gateway
# An internet gateway is a horizontally scaled, redundant, and highly available VPC component that allows communication between instances in your VPC and the internet. It therefore imposes no availability risks or bandwidth constraints on your network traffic.

resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main-vpc.id
  tags = {
    Name = "main-igw"
  }
}


# Route Table
# A route table contains a set of rules, called routes, that are used to determine where network traffic from your subnet or gateway is directed.

resource "aws_route_table" "main-public-rt" {
  vpc_id = aws_vpc.main-vpc.id
  route {
    cidr_block = "0.0.0.0/0" # This is for all traffic
    gateway_id = aws_internet_gateway.main-igw.id
  }
  tags = {
    Name = "main-public-rt"
  }
}

# Route Table Association
# A route table association is a relationship between a subnet and a route table. This controls the routing for the subnet.

resource "aws_route_table_association" "main-public-rt-assoc" {
  subnet_id      = aws_subnet.main-subnet.id
  route_table_id = aws_route_table.main-public-rt.id
}
