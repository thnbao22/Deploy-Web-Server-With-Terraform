#!/bin/bash

# Updates the package list for the package manager.
sudo apt update -y
# Installs the Apache web server software.
sudo apt install apache2 -y
# Starts the Apache web server service.
sudo systemctl start apache2
# Creates a simple index.html file with the text “your very first web server” in the root document directory of the web server (/var/www/html).
sudo bash -c ’echo your very first web server > /var/www/html/index.html’
