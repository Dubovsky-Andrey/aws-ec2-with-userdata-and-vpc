# Output the VPC ID
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.ec2_simple_vpc.id
}