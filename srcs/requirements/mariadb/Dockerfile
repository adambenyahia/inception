FROM debian:bullseye


RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install htop systemctl dialog mariadb-server vim -y

RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

RUN mkdir -p /var/lib/mysql \
    && chown -R mysql:mysql /var/lib/mysql \
    && chmod 777 /var/lib/mysql

ARG MYSQL_ROOT_PASSWORD
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

ARG MYSQL_ADMIN_USER
ENV MYSQL_ADMIN_USER=$MYSQL_ADMIN_USER

ARG MYSQL_PASSWORD
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD

ARG MYSQL_DATABASE
ENV MYSQL_DATABASE=$MYSQL_DATABASE

COPY tools/config.sh /usr/local/bin/config.sh
RUN chmod +x /usr/local/bin/config.sh
RUN config.sh


ENTRYPOINT [ "mysqld" ] 

