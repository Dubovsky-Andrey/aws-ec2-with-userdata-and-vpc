# AWS region for provider
variable "aws_region" {
  description = "AWS region"
  type        = string
}

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

# List of allowed CIDR blocks for security group ingress rules
variable "allowed_cidrs" {
  description = "List of allowed CIDR blocks"
  type        = list(string)
}

# EC2 instance name tag
variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

# Security group name
variable "sg_name" {
  description = "Security group name"
  type        = string
}

# Associate public IP address with the EC2 instance
variable "associate_public_ip_address" {
  description = "Associate public IP address with the EC2 instance"
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
    protocol    = optional(string),
    cidr_blocks = list(string)
  }))
}

# VPC module variables
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
}

variable "subnet_name" {
  description = "Name for the subnet"
  type        = string
}

variable "user_data_path" {
  description = "User data script for the EC2 instance"
  type        = string
}
