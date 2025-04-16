# AMI ID for the EC2 instance
variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

# EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

# Subnet ID for the EC2 instance
variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}

# VPC ID for the security group
variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

# List of allowed CIDR blocks for security group ingress rules
variable "allowed_cidrs" {
  description = "List of allowed CIDR blocks for security group ingress rules"
  type        = list(string)
}

# Name tag for the EC2 instance
variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

# Security group name
variable "sg_name" {
  description = "Security group name"
  type        = string
}

# Associate public IP with the EC2 instance
variable "associate_public_ip_address" {
  description = "Associate public IP with the EC2 instance"
  type        = bool
}

# Tags for the EC2 instance
variable "tags" {
  description = "Tags for the EC2 instance"
  type        = map(string)
}

# List of ingress port objects with port, description, and optionally protocol
variable "ingress_ports" {
  description = "List of ingress port objects with port, description, and protocol"
  type = list(object({
    port        = number,
    description = string,
    protocol    = optional(string)
  }))
}

# List of egress rule objects with description, from_port, to_port, protocol and cidr_blocks
variable "egress_rules" {
  description = "List of egress rule objects with description, from_port, to_port, protocol and cidr_blocks"
  type = list(object({
    description = string,
    from_port   = number,
    to_port     = number,
    protocol    = optional(string), # protocol is optional; default will be used if not provided
    cidr_blocks = list(string)
  }))
}

variable "user_data" {
  description = "User Data for the EC2 instance"
  type        = string
}
