# Output the ID of the created EC2 instance
output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.ec2_simple.id
}

# Output the ID of the created security group
output "security_group_id" {
  description = "ID of the created security group"
  value       = aws_security_group.ec2_simple_sg.id
}

# Output the public IP address of the created EC2 instance
output "public_ip" {
  description = "Public IP address of the created EC2 instance"
  value       = aws_instance.ec2_simple.public_ip
}