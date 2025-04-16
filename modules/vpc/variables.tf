# CIDR block for the VPC
variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

# Name for the VPC
variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
}

# CIDR block for the subnet
variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
}

# Availability zone for the subnet
variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
}

# Name for the subnet
variable "subnet_name" {
  description = "Name for the subnet"
  type        = string
}
