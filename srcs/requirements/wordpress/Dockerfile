FROM debian:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    nginx \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-gd \
    php7.4-curl \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-zip \
    unzip \
    curl \
    mariadb-client

COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

RUN	adduser -S nginx &&	addgroup -S nginx