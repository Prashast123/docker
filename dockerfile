# Base image
FROM php:7.4-fpm

# Install required packages
RUN apt-get update && \
    apt-get install -y nginx

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy PHP-FPM configuration file
COPY www.conf /usr/local/etc/php-fpm.d/www.conf

# Copy application files
COPY index.php /var/www/html/index.php

# Expose ports
EXPOSE 80

# Start Nginx and PHP-FPM services
CMD service nginx start && php-fpm
