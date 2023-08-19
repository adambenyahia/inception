#!/bin/bash

# this is the mariadb entrypoint script

service mariadb start


check_mysql()
{
    mysqladmin ping -h localhost --user=root --password=$MYSQL_ROOT_PASSWORD 2> /dev/null 
}




MAX_TRIES=30
TRY=1
while ! check_mysql && [ $TRY -lt $MAX_TRIES ]; do
  echo "Waiting for MariaDB to become responsive... (Attempt $TRY)"
  TRY=$((TRY + 1))
done

if [ $TRY -ge $MAX_TRIES ]; then
  echo "Max attempts reached. MariaDB didn't start properly."
  exit 1
fi



useradd -m -p "$MYSQL_PASSWORD" clark
useradd -m -p "$MYSQL_ROOT_PASSWORD" $MYSQL_USER 

# create database

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> db1.sql
echo "CREATE USER IF NOT EXISTS 'clark'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> db1.sql
echo "GRANT SELECT ON $MYSQL_DATABASE.* TO 'clark'@'localhost' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql
mysqladmin -u root password "$MYSQL_ROOT_PASSWORD"

service mariadb stop