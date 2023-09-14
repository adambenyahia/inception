#!/bin/bash

# this is the mariadb entrypoint script

sed -i "/^\[mysqld\]/a lower_case_table_names = 2" "/etc/mysql/mariadb.conf.d/50-server.cnf"

chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

service mariadb start

# create database

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;" > database.sql
echo "CREATE USER IF NOT EXISTS '$WP_ADMIN_USER'@'%' IDENTIFIED BY '$WP_ADMIN_PASSWORD' ;" >> database.sql
echo "CREATE USER IF NOT EXISTS '$WP_USER'@'%' IDENTIFIED BY '$WP_USER_PASSWORD' ;" >> database.sql
echo "GRANT SELECT ON $MYSQL_DATABASE.* TO '$WP_USER'@'%' ;" >> database.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$WP_ADMIN_USER'@'%' ;" >> database.sql
echo "FLUSH PRIVILEGES;" >> database.sql 

# allow remote connections

sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

mysql < database.sql

rm -rf database.sql

# sleep infinity . just kidding, we're not in a container
