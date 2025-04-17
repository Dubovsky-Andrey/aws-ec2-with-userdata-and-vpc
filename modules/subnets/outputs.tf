# Output the Subnet ID
output "subnet_id" {
  description = "Subnet ID"
  value       = aws_subnet.ec2_simple_vpc_subnet.id
}