FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y htop php php-fpm \
php-cgi php-cli php-mysql php-mbstring mariadb-client less netcat wget unzip 

ARG MYSQL_ADMIN_USER
ENV MYSQL_ADMIN_USER=$MYSQL_ADMIN_USER

ARG MYSQL_PASSWORD
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD

ARG MYSQL_DATABASE
ENV MYSQL_DATABASE=$MYSQL_DATABASE

ARG MYSQL_HOSTNAME
ENV MYSQL_HOSTNAME=$MYSQL_HOSTNAME

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN cp wp-cli.phar /usr/local/bin/wp && rm wp-cli.phar
RUN chmod +x  /usr/local/bin/wp

COPY script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh
RUN script.sh

COPY install.sh /usr/local/bin/install.sh
RUN chmod +x /usr/local/bin/install.sh



ENTRYPOINT ["install.sh"]

