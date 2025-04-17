# Call the VPC module to create a VPC and a subnet
module "vpc" {
  source = "./modules/vpc"

  cidr_block        = var.vpc_cidr
  vpc_name          = var.vpc_name
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
  subnet_name       = var.subnet_name
}

# Call the route table module to create a route table
module "route_table" {
  source     = "./modules/route_table"
  vpc_id     = module.vpc.vpc_id
  gateway_id = module.internet_gateway.igw_id
  subnet_id  = module.subnets.subnet_id
  vpc_name   = var.vpc_name
}

module "internet_gateway" {
  source   = "./modules/internet_gateway"
  vpc_id   = module.vpc.vpc_id
  vpc_name = var.vpc_name
}

module "subnets" {
  source            = "./modules/subnets"
  vpc_id            = module.vpc.vpc_id
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
  subnet_name       = var.subnet_name
}

# Call the EC2 module to create an instance with security group
module "ec2" {
  source = "./modules/ec2"

  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = module.subnets.subnet_id
  vpc_id                      = module.vpc.vpc_id
  allowed_cidrs               = var.allowed_cidrs
  instance_name               = var.instance_name
  sg_name                     = var.sg_name
  associate_public_ip_address = var.associate_public_ip_address
  tags                        = var.tags
  ingress_ports               = var.ingress_ports
  egress_rules                = var.egress_rules
  user_data                   = file(var.user_data_path)
}
