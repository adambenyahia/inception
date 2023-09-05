FROM debian:bullseye

RUN apt-get update && apt-get install -y bind9 dnsutils

COPY beadam.42.fr.zone /etc/bind/zones/beadam.42.fr.zone
COPY named.conf.local /etc/bind/named.conf.local
COPY named.conf.options /etc/bind/named.conf.options


EXPOSE 53

CMD ["named", "-f"]