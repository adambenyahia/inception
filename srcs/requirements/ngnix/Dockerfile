FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y nginx openssl netcat

EXPOSE 443

RUN mkdir /etc/nginx/ssl

COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN openssl req -newkey rsa:4096 -sha256 -x509 -days 100 -nodes -out /etc/nginx/ssl/ssl.crt -keyout /etc/nginx/ssl/ssl.key -subj "/L=Khouribga/O=42/OU=1337kh/CN=beadam/"

ENTRYPOINT ["nginx", "-g" ,"daemon off;"]
