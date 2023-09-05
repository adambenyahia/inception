#!/bin/bash

if wp core is-installed --allow-root --path=/var/www/html; then
    echo "WordPress is already installed.... skipping installation process !"
else
    cd /var/www/html
    wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
    wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --allow-root
    wp plugin install redis-cache --allow-root
    wp plugin update --all --allow-root
    wp plugin activate redis-cache --allow-root
    wp redis enable --force --allow-root
fi

php-fpm7.4 -F