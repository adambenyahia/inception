#!/bin/bash

# Generate SSL certificate and key
openssl req -newkey rsa:4096 -sha256 -x509 -days 100 -nodes -out /etc/nginx/ssl/ssl.crt -keyout /etc/nginx/ssl/ssl.key -subj "/L=Khouribga/O=42/OU=1337kh/CN=beadam/"

# chmod 777 /etc/nginx/ssl/ssl.crt /etc/nginx/ssl/ssl.key
# ls -l /etc/nginx/ssl/

# check format
# openssl x509 -noout -text -in /etc/nginx/ssl/ssl.crt

# Start NGINX
nginx -g "daemon off;"
