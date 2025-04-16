# Output the VPC ID
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.ec2_simple_vpc.id
}

# Output the Subnet ID
output "subnet_id" {
  description = "Subnet ID"
  value       = aws_subnet.ec2_simple_vpc_subnet.id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}
