# AWS EC2 with VPC Infrastructure

## Overview

This project provides Terraform configuration for deploying an AWS EC2 instance within a custom VPC. It includes network configuration with public and private subnets, security groups, and necessary routing.

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 1.0.0 or higher)
- Basic understanding of AWS VPC and EC2 concepts

## Project Structure

```
aws-ec2-with-vpc-simple/
├── main.tf                 # Main infrastructure configuration
├── variables.tf            # Variable definitions
├── outputs.tf             # Output definitions
├── provider.tf            # AWS provider configuration
├── terraform.tfvars       # Variable values
└── README.md             # Project documentation
```

## Features

- Custom VPC with defined CIDR block
- Public and private subnets across availability zones
- Internet Gateway for public subnet access
- Security groups for EC2 instance
- EC2 instance with specified AMI and instance type
- Network ACLs and routing tables

## Configuration

### Required Variables

Update the following variables in `terraform.tfvars`:

```
aws_region     = "us-west-2"
instance_type  = "t2.micro"
vpc_cidr       = "10.0.0.0/16"
public_subnet  = "10.0.1.0/24"
```

## Deployment

1. Initialize Terraform:

```
terraform init
```

2. Review the deployment plan:

```
terraform plan
```

3. Apply the configuration:

```
terraform apply
```

4. To destroy the infrastructure:

```
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
