FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install htop dialog redis vim -y

RUN mkdir -p /var/run/redis \
    && chown -R redis:redis /var/run/redis \
    && chmod 777 /var/run/redis

RUN mkdir -p /var/lib/redis \
    && chown -R redis:redis /var/lib/redis \
    && chmod 777 /var/lib/redis

RUN sed -i "s/bind 127.0.0.1 ::1/bind 0.0.0.0/g" /etc/redis/redis.conf
RUN sed -i "s/protected-mode yes/protected-mode no/g" /etc/redis/redis.conf
RUN sed -i "s/# maxmemory <bytes>/maxmemory 128mb/g" /etc/redis/redis.conf
RUN sed -i "s/daemonize yes/daemonize no/g" /etc/redis/redis.conf


CMD [ "redis-server", "/etc/redis/redis.conf"]
