#!/bin/bash

# this is the mariadb entrypoint script

sed -i "/^\[mysqld\]/a lower_case_table_names = 2" "/etc/mysql/mariadb.conf.d/50-server.cnf"

chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

service mariadb start

# create database

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;" > database.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_ADMIN_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> database.sql
echo "CREATE USER IF NOT EXISTS 'clark'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> database.sql
echo "GRANT SELECT ON $MYSQL_DATABASE.* TO 'clark'@'%' ;" >> database.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN_USER'@'%' ;" >> database.sql
echo "FLUSH PRIVILEGES;" >> database.sql 

# allow remote connections

sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

mysql < database.sql

rm -rf database.sql

# sleep infinity . just kidding, we're not in a container
