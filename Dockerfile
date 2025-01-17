FROM alpine:latest

RUN apk add nut \
 && mkdir -p /var/run/nut \
 && chown nut:nut /var/run/nut

COPY ups.conf /etc/nut/ups.conf
COPY upsmon.conf /etc/nut/upsmon.conf
COPY upsd.conf /etc/nut/upsd.conf
COPY nut.conf /etc/nut/nut.conf
COPY upsd.users /etc/nut/upsd.users
COPY dummy.seq /etc/nut/dummy.seq
COPY entrypoint.sh /bin/entrypoint

RUN chown nut:nut /etc/nut/* \
 && chmod 600 /etc/nut/* \
 && chmod +x /bin/entrypoint

ENTRYPOINT ["/bin/entrypoint"]