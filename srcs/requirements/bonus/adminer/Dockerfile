FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y htop php php-fpm \
php-cgi php-cli php-mysql php-mbstring less netcat wget unzip 

RUN mkdir -p /run/php


RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php"
RUN mv adminer-4.8.1-mysql-en.php /run/php/adminer.php


ENTRYPOINT ["php" , "-S" , "0.0.0.0:8080" , "-t" , "/run/php" , "/run/php/adminer.php"]