FROM debian:latest

RUN apt-get update && apt-get upgrade && apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -sha256 -days 100 -nodes -out /etc/nginx/ssl/ssl.pem \
    -keyout /etc/nginx/ssl/ssl.key \ 
    -subj "/L=Khouribga/O=42/OU=1337-kh/CN=beadam/"

RUN mkdir -p /run/ngnix
COPY nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT [ "ngnix","-g", "daemon off;" ]