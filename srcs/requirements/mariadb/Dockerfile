FROM debian:latest

RUN apt-get update && \
    apt-get upgrade && \
    apt-get -y install \
    mariadb \
    mariadb-client



COPY config.sh /usr/local/bin/config.sh
RUN chmod +x /usr/local/bin/config.sh

EXPOSE 3306

ENTRYPOINT [ "sh", "/tmp/config.sh" ]