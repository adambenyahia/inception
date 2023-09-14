#!/bin/bash

if [ ! -f srcs/.env ]; then 
    echo "srcs/.env file not found."
    read -p "Domain name: " DOMAIN_NAME
    read -p "WordPress title: " WP_TITLE
    read -p "WordPress admin user: " WP_ADMIN_USER
    read -p "WordPress admin password: " WP_ADMIN_PASSWORD
    read -p "WordPress admin email: " WP_ADMIN_EMAIL
    read -p "WordPress user: " WP_USER
    read -p "WordPress user password: " WP_USER_PASSWORD
    read -p "WordPress user email: " WP_USER_EMAIL


    echo "DOMAIN_NAME=$DOMAIN_NAME" >> srcs/.env
    echo "MYSQL_HOSTNAME=mariadb" >> srcs/.env
    echo "MYSQL_DATABASE=wp_maria" >> srcs/.env
    echo "WP_TITLE=$WP_TITLE" >> srcs/.env
    echo "WP_ADMIN_USER=$WP_ADMIN_USER" >> srcs/.env
    echo "WP_ADMIN_PASSWORD=$WP_ADMIN_PASSWORD" >> srcs/.env
    echo "WP_ADMIN_EMAIL=$WP_ADMIN_EMAIL" >> srcs/.env
    echo "WP_USER=$WP_USER" >> srcs/.env
    echo "WP_USER_PASSWORD=$WP_USER_PASSWORD" >> srcs/.env
    echo "WP_USER_EMAIL=$WP_USER_EMAIL" >> srcs/.env
    echo "VOLUME_PATH=~/data" >> srcs/.env
else
    echo "env file exists."
fi
