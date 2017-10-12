#!/bin/bash
echo "Installing Magento dependencies..."
cd /var/www/html/magento && composer install
echo "Installing WordPress dependencies..."
cd /var/www/html/wp && composer install
cd /var/www/html && chown -R www-data:www-data .
