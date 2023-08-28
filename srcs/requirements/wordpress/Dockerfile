FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y htop php php-fpm \
php-cgi php-cli php-mysql php-mbstring mariadb-client less netcat wget unzip 

ARG MYSQL_USER
ENV MYSQL_USER=$MYSQL_USER

ARG MYSQL_PASSWORD
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD

ARG MYSQL_DATABASE
ENV MYSQL_DATABASE=$MYSQL_DATABASE

ARG MYSQL_HOSTNAME
ENV MYSQL_HOSTNAME=$MYSQL_HOSTNAME

# ARG DOMAIN_NAME
# ENV DOMAIN_NAME=$DOMAIN_NAME

# ARG WP_TITLE
# ENV WP_TITLE=$WP_TITLE

# ARG WP_ADMIN_USER
# ENV WP_ADMIN_USER=$WP_ADMIN_USER

# ARG WP_ADMIN_PASSWORD
# ENV WP_ADMIN_PASSWORD=$WP_ADMIN_PASSWORD

# ARG WP_ADMIN_EMAIL
# ENV WP_ADMIN_EMAIL=$WP_ADMIN_EMAIL

# ARG WP_USER
# ENV WP_USER=$WP_USER

# ARG WP_USER_PASSWORD
# ENV WP_USER_PASSWORD=$WP_USER_PASSWORD

# ARG WP_USER_EMAIL
# ENV WP_USER_EMAIL=$WP_USER_EMAIL


EXPOSE 9000

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN cp wp-cli.phar /usr/local/bin/wp && rm wp-cli.phar
RUN chmod +x  /usr/local/bin/wp

COPY script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh
RUN script.sh

COPY install.sh /usr/local/bin/install.sh
RUN chmod +x /usr/local/bin/install.sh



ENTRYPOINT ["install.sh"]

