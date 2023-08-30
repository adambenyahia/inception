#!/bin/bash


mkdir -p /run/php /var/www/html


if [ ! -f /var/www/html/wp-config.php ]
then

cd /tmp
wget https://wordpress.org/latest.zip
unzip latest.zip -d /var/www/html
rm latest.zip
cd /var/www/html
cp -r wordpress/* .
rm -rf wordpress


# chown -R root:root /var/www/html/*

sed -i "s/username_here/$MYSQL_ADMIN_USER/g"          wp-config-sample.php
sed -i "s/password_here/$MYSQL_PASSWORD/g"      wp-config-sample.php
sed -i "s/localhost/$MYSQL_HOSTNAME/g"          wp-config-sample.php
sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
cp wp-config-sample.php wp-config.php

sed -i 's/^listen = .*/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf

sed -i "/<?php/a define('FS_METHOD', 'direct');" wp-config.php
sed -i "/<?php/a define('WP_CACHE', true);" wp-config.php
sed -i "/<?php/a define('WP_CACHE_KEY_SALT', 'beadam.42.fr');" wp-config.php
sed -i "/<?php/a define('WP_REDIS_HOST', 'redis');" wp-config.php
sed -i "/<?php/a define('WP_REDIS_PORT', 6379);" wp-config.php
sed -i "/<?php/a define('WP_REDIS_TIMEOUT', 1);" wp-config.php
sed -i "/<?php/a define('WP_REDIS_READ_TIMEOUT', 1);" wp-config.php
sed -i "/<?php/a define('WP_REDIS_DATABASE', 0);" wp-config.php

fi






