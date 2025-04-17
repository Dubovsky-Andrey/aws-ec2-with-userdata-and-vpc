# Create a VPC
resource "aws_vpc" "ec2_simple_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_name
  }
}