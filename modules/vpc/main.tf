# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ec2_simple_vpc.id
  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

# Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.ec2_simple_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "public_subnet_assoc" {
  subnet_id      = aws_subnet.ec2_simple_vpc_subnet.id
  route_table_id = aws_route_table.public_rt.id
}


# Create a VPC
resource "aws_vpc" "ec2_simple_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_name
  }
}

# Create a subnet for the VPC
resource "aws_subnet" "ec2_simple_vpc_subnet" {
  vpc_id            = aws_vpc.ec2_simple_vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone
  tags = {
    Name = var.subnet_name
  }
}
