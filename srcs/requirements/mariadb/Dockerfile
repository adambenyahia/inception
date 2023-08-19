
# RUN apt-get update && \
#     apt-get upgrade && \
#     apt-get -y install \
#     mariadb-server mariadb-client \
#     htop




# COPY config.sh /usr/local/bin/config.sh
# RUN chmod +x /usr/local/bin/config.sh

# EXPOSE 3306
# ENTRYPOINT [ "config.sh" ]


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

ARG MYSQL_USER
ENV MYSQL_USER=$MYSQL_USER

ARG MYSQL_PASSWORD
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD

ARG MYSQL_DATABASE
ENV MYSQL_DATABASE=$MYSQL_DATABASE


COPY 50-server.cnf /etc/mysql/mariadb.conf.d/


COPY config.sh /usr/local/bin/config.sh
RUN chmod +x /usr/local/bin/config.sh && config.sh


ENTRYPOINT [ "mysqld_safe" ] 
