#!/bin/bash
sudo su -
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Deployed via Terraform</h1>" > /var/www/html/index.html
echo "<h2>Batman was here</h2>" >> /var/www/html/index.html
echo "<h3>Using AMI ID: ${ami_id}</h3>" >> /var/www/html/index.html