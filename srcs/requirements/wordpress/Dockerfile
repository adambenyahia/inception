FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y htop php php-fpm php-gd php-cgi php-cli php-mysql php-mbstring mariadb-client wget unzip 

EXPOSE 9000

COPY script.sh /usr/local/bin/script.sh

RUN chmod +x /usr/local/bin/script.sh

ENTRYPOINT ["script.sh"]
