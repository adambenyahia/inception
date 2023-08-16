FROM debian:latest

RUN apt-get update && \
    apt-get upgrade && \
    apt-get -y install \
    mariadb-server 

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld


COPY config.sh /usr/local/bin/config.sh
RUN chmod +x /usr/local/bin/config.sh

EXPOSE 3306

ENTRYPOINT [ "sh", "/tmp/config.sh" ]