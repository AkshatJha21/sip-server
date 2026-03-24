FROM andrius/asterisk:latest

USER root

RUN apt-get update && apt-get install -y openssl && rm -rf /var/lib/apt/lists/*

COPY pjsip.conf /etc/asterisk/pjsip.conf
COPY pjsip_aor.conf /etc/asterisk/pjsip_aor.conf
COPY extensions.conf /etc/asterisk/extensions.conf
COPY http.conf /etc/asterisk/http.conf
COPY rtp.conf /etc/asterisk/rtp.conf

RUN mkdir -p /etc/asterisk/keys && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/asterisk/keys/asterisk.key \
    -out /etc/asterisk/keys/asterisk.pem \
    -subj "/CN=asterisk" && \
    chmod 640 /etc/asterisk/keys/asterisk.key && \
    chmod 644 /etc/asterisk/keys/asterisk.pem && \
    chown -R asterisk:asterisk /etc/asterisk/keys/

EXPOSE 5060/udp 5060/tcp 8088/tcp 8089/tcp 10000-10100/udp