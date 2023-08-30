#!/bin/bash

#this is a mariadb health check script for wordpress

message="Waiting for MariaDB to become available..."
loading_chars="/-\|"

echo -n "$message"

echo -ne "\r"

for ((i=0; i<50; i++)); do
    if nc -z mariadb 3306; then
        break
    fi
    
    echo -n "${loading_chars:i%4:1}"
    sleep 0.5
    echo -ne "\r"
done

echo -ne "\r\033[K$message Done!\n"

