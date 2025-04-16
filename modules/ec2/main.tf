# Create a security group with dynamic ingress rules
resource "aws_security_group" "ec2_simple_sg" {
  name   = var.sg_name
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = lookup(ingress.value, "protocol", "tcp")
      cidr_blocks = var.allowed_cidrs
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = lookup(egress.value, "protocol", "-1")
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}

# Create an EC2 instance with the security group
resource "aws_instance" "ec2_simple" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.ec2_simple_sg.id]
  associate_public_ip_address = var.associate_public_ip_address
  user_data                   = var.user_data

  tags = merge(
    var.tags,
    {
      Name = var.instance_name
    }
  )
}
