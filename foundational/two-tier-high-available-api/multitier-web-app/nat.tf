
# Elastic IP
# An Elastic IP address is associated with your AWS account. With an Elastic IP address, you can mask the failure of an instance or software by rapidly remapping the address to another instance in your account.
resource "aws_eip" "main-eip" {
  domain = "vpc"
  tags = {
    Name = "main-eip"
  }
}

# NAT Gateway
# A NAT gateway  enables instances in a private subnet to connect to the internet or other AWS services, but prevents the internet from initiating a connection with those instances.
resource "aws_nat_gateway" "main-nat-gw" {
  allocation_id = aws_eip.main-eip.id
  subnet_id     = aws_subnet.main-public-1.id
  depends_on    = [aws_internet_gateway.main-igw]
  tags = {
    Name = "main-nat-gw"
  }
}


# Route Table
# This is the route table that will be associated with the private subnet

resource "aws_route_table" "main-private-rt" {
  vpc_id = aws_vpc.main-vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main-nat-gw.id
  }
  tags = {
    Name = "main-private-rt"
  }
}

# Route Table Association
# This is the route table association that will be associated with the private subnet

resource "aws_route_table_association" "main-private-rta" {
  subnet_id      = aws_subnet.main-private-subnet.id
  route_table_id = aws_route_table.main-private-rt.id
}

