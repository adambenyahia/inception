
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


RUN apt-get update -y && apt-get install htop systemctl dialog mariadb-server vim -y

RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

RUN mkdir -p /var/lib/mysql \
    && chown -R mysql:mysql /var/lib/mysql \
    && chmod 777 /var/lib/mysql


COPY 50-server.cnf /etc/mysql/mariadb.conf.d/


COPY config.sh /usr/local/bin/config.sh
RUN chmod +x /usr/local/bin/config.sh

CMD [ "config.sh" ]

ENTRYPOINT [ "/usr/bin/mysqld_safe" ]