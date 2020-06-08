#! /bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "</h1> This is Terraform Testing Server </h1>" > /var/www/html/index.html
