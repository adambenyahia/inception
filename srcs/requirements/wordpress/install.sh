#!/bin/bash

if wp core is-installed --allow-root --path=/var/www/html; then
    echo "WordPress is already installed.... skipping installation process !"
else
    wp core install --path=/var/www/html --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
    wp user create --path=/var/www/html $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --allow-root
fi

php-fpm7.4 -F