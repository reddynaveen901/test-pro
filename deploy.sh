#!/bin/bash

# Variables
APP_DIR="/var/www/html"
DB_INFO_FILE="/var/www/inc/dbinfo.inc"

# Update system and install dependencies
sudo yum update -y
sudo yum install -y httpd php-mysqlnd git

# Start and enable Apache
sudo systemctl start httpd
sudo systemctl enable httpd

# Deploy the application
sudo mkdir -p /var/www/inc
sudo cp ./dbinfo.inc "$DB_INFO_FILE"
sudo cp ./SamplePage.php "$APP_DIR/"

# Set permissions
sudo chown -R apache:apache /var/www
sudo chmod -R 755 /var/www

echo "Deployment completed!"
