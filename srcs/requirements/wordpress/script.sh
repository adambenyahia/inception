#!/bin/bash


mkdir -p /run/php /var/www/html

bash



if [ ! -f /var/www/html/wp-config.php ]
then

cd /tmp
wget https://wordpress.org/latest.zip
unzip latest.zip -d /var/www/html
rm latest.zip
cd /var/www/html
cp -r wordpress/* .
rm -rf wordpress


sed -i "s/username_here/$MYSQL_USER/g"          wp-config-sample.php
sed -i "s/password_here/$MYSQL_PASSWORD/g"      wp-config-sample.php
sed -i "s/localhost/$MYSQL_HOSTNAME/g"          wp-config-sample.php
sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
cp wp-config-sample.php wp-config.php
fi


chown -R www-data:www-data /var/www/html

sed -i 's/^listen = .*/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf

php-fpm7.4 -F