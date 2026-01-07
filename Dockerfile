FROM andrius/asterisk:latest

USER root

RUN apt-get update && apt-get install -y openssl && rm -rf /var/lib/apt/lists/*

COPY pjsip.conf /etc/asterisk/pjsip.conf
COPY extensions.conf /etc/asterisk/extensions.conf
COPY general.conf /etc/asterisk/general.conf

RUN mkdir -p /etc/asterisk/keys && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/asterisk/keys/asterisk.key \
    -out /etc/asterisk/keys/asterisk.pem \
    -subj "/CN=asterisk"

EXPOSE 8089 10000-10100/udp
