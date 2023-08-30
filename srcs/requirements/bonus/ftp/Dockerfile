FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y htop systemctl vsftpd

ARG WP_ADMIN_USER
ENV WP_ADMIN_USER=$WP_ADMIN_USER

ARG WP_ADMIN_PASSWORD
ENV WP_ADMIN_PASSWORD=$WP_ADMIN_PASSWORD



RUN mkdir -p /var/run/vsftpd/empty /home/${WP_ADMIN_USER}

RUN useradd -m -d /home/${WP_ADMIN_USER} ${WP_ADMIN_USER}

RUN echo "${WP_ADMIN_USER}:${WP_ADMIN_PASSWORD}" | chpasswd

RUN echo "${WP_ADMIN_USER}" >> /etc/vsftpd.userlist

RUN chown ${WP_ADMIN_USER}:${WP_ADMIN_USER} /home/${WP_ADMIN_USER}


COPY vsftpd.conf /etc/vsftpd.conf



ENTRYPOINT [ "vsftpd", "/etc/vsftpd.conf"]