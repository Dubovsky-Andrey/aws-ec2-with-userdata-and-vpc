#!/bin/bash

# Wait for the network to be up
until ping -c1 8.8.8.8 &>/dev/null; do
  sleep 1
done


# Update packages and install httpd
echo "<h1>Hello from EC2 user-data</h1>" > /home/ec2-user/index.html
yum install -y httpd
echo "<h1>Hello from EC2 user-data</h1>" > /var/www/html/index.html
systemctl enable httpd
systemctl start httpd
