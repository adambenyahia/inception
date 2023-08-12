FROM debian:latest

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/script.sh

CMD ["script.sh"]
