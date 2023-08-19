FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y nginx openssl

EXPOSE 443

RUN mkdir /etc/nginx/ssl

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/script.sh

ENTRYPOINT ["script.sh"]
