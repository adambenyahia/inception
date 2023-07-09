FROM debian:latest

RUN apt-get update && \
    apt-get upgrade && \
    apt-get -y install \
    mariadb \
    mariadb-client

COPY config.sh /tmp/config.sh

ENTRYPOINT [ "sh", "/tmp/config.sh" ]