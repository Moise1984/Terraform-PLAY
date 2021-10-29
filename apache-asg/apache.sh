#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
echo "<h1>moise Terraform Expert</h1>" | sudo tee /var/www/html/index.html