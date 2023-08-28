FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y htop systemctl vsftpd

ARG FTP_USER
ENV FTP_USER=$FTP_USER

ARG FTP_PASSWORD
ENV FTP_PASSWORD=$FTP_PASSWORD

ARG FTP_HOSTNAME
ENV FTP_HOSTNAME=$FTP_HOSTNAME



EXPOSE 21 20

ENTRYPOINT [ "sleep", "infinity" ]