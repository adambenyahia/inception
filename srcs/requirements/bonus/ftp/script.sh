#!/bin/bash

# configure ftp

# create user

adduser $FTP_USER --disabled-password --gecos "" 
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd 
