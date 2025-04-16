aws_region                  = "us-east-1"
ami                         = "ami-05f417c208be02d4d"
instance_type               = "t4g.nano"
allowed_cidrs               = ["0.0.0.0/0"]
instance_name               = "aws-ec2-with-userdata-and-vpc"
sg_name                     = "aws-ec2-with-userdata-and-vpc-sg"
associate_public_ip_address = true
tags = {
  Environment = "dev"
  Project     = "aws-ec2-with-userdata-and-vpc"
}
ingress_ports = [
  {
    port        = 80
    description = "Allow HTTP"
    protocol    = "tcp"
  }
]

egress_rules = [
  {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

# VPC module variables
vpc_cidr          = "10.0.0.0/16"
vpc_name          = "aws-ec2-with-userdata-and-vpc-vpc"
subnet_cidr       = "10.0.1.0/24"
availability_zone = "us-east-1a"
subnet_name       = "aws-ec2-with-userdata-and-vpc-subnet"

user_data_path = "modules/ec2/scripts/user-data.sh"