FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y php php-fpm \
php-cgi php-cli php-mysql php-mbstring mariadb-client wget unzip 

ARG WP_ADMIN_USER
ENV WP_ADMIN_USER=$WP_ADMIN_USER

ARG WP_ADMIN_PASSWORD
ENV WP_ADMIN_PASSWORD=$WP_ADMIN_PASSWORD

ARG MYSQL_DATABASE
ENV MYSQL_DATABASE=$MYSQL_DATABASE

ARG MYSQL_HOSTNAME
ENV MYSQL_HOSTNAME=$MYSQL_HOSTNAME

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN cp wp-cli.phar /usr/local/bin/wp && rm wp-cli.phar
RUN chmod +x  /usr/local/bin/wp

COPY tools/script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh
RUN script.sh

COPY tools/init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh



ENTRYPOINT ["init.sh"]

