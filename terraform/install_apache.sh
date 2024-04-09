#!/bin/bash 
# Scrip to install apache server
yum update -y
yum install httpd
sudo systemctl start httpd
sudo systemctl status httpd