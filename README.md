# AWS EC2 with UserData and VPC

This Terraform project creates an AWS EC2 instance with custom UserData script in a dedicated VPC.

## Overview

This project provides Terraform configuration for deploying an AWS EC2 instance within a custom VPC. It includes network configuration with public and private subnets, security groups, and necessary routing.

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 1.0.0 or higher)
- Basic understanding of AWS VPC and EC2 concepts

## Project Structure

```
aws-ec2-with-userdata-and-vpc/
├── modules/
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   │   └── scripts/
│   │       └── user-data.sh
│   └── vpc/
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── main.tf
├── outputs.tf
├── variables.tf
├── terraform.tfvars
└── README.md
```

## Features

- Custom VPC with defined CIDR block
- Public and private subnets across availability zones
- Internet Gateway for public subnet access
- Security groups for EC2 instance
- EC2 instance with specified AMI and instance type
- Network ACLs and routing tables

## Infrastructure Components

- VPC with custom CIDR block (10.0.0.0/16)
- Public subnet in us-east-1a
- Internet Gateway for public internet access
- Security Group with HTTP ingress
- EC2 t4g.nano instance with UserData script
- Route table for internet access

## Module Structure

### VPC Module

- Creates VPC infrastructure
- Manages subnet, internet gateway, and routing

### EC2 Module

- Handles instance deployment
- Configures security groups
- Implements UserData script

## Configuration

### Required Variables

Update the following variables in `terraform.tfvars`:

```hcl
aws_region = "us-east-1"
ami        = "ami-05f417c208be02d4d"
vpc_cidr   = "10.0.0.0/16"
```

## Deployment

1. Initialize Terraform:

```bash
terraform init
```

2. Review the deployment plan:

```bash
terraform plan
```

3. Apply the configuration:

```bash
terraform apply
```

4. To destroy the infrastructure:

```bash
terraform destroy
```

## Outputs

After successful deployment, you'll receive:

- VPC ID
- Public Subnet ID
- EC2 Instance ID
- EC2 Public IP

## Best Practices

- Always review the plan before applying changes
- Use appropriate instance types based on your needs
- Regularly update your AWS provider version
- Monitor your AWS costs
- Use tags for better resource management

## Security

Default security configuration:

- Inbound: HTTP (port 80)
- Outbound: All traffic allowed

## Tags

Resources are tagged with:

- Environment: dev
- Project: aws-ec2-with-userdata-and-vpc

## Troubleshooting

Common issues and solutions:

1. **Connection Issues**

   - Verify your AWS credentials
   - Check security group rules
   - Ensure internet gateway is properly attached

2. **Subnet Issues**
   - Verify CIDR blocks don't overlap
   - Check route table associations
   - Ensure proper availability zone assignment

## Support

For issues and feature requests, please create an issue in the project repository.

## License

MIT License
