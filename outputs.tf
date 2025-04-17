# Output the EC2 instance ID from the EC2 module
output "instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2.instance_id
}

# Output the Security Group ID from the EC2 module
output "security_group_id" {
  description = "Security Group ID"
  value       = module.ec2.security_group_id
}

# Output the VPC ID from the VPC module
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

# Output the Subnet ID from the VPC module
output "subnet_id" {
  description = "Subnet ID"
  value       = module.subnets.subnet_id
}

# Output the public IP address of the created EC2 instance
output "public_ip" {
  description = "Public IP address of the created EC2 instance"
  value       = module.ec2.public_ip
}

# Output the public IP address of the created EC2 instance
output "public_link" {
  description = "Public link for the site"
  value       = "http://${module.ec2.public_ip}"
}