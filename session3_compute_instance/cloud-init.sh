#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
systemctl enable httpd
systemctl start httpd
