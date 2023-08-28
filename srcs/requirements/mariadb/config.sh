#!/bin/bash

# this is the mariadb entrypoint script

service mariadb start

# create database

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;" > database.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> database.sql
echo "CREATE USER IF NOT EXISTS 'clark'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> database.sql
echo "GRANT SELECT ON $MYSQL_DATABASE.* TO 'clark'@'%' ;" >> database.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;" >> database.sql
echo "FLUSH PRIVILEGES;" >> database.sql

mysql < database.sql

rm -rf database.sql

# sleep infinity . just kidding, we're not in a container
