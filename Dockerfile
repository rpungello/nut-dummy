FROM alpine:latest

RUN apk add nut \
 && mkdir -p /var/run/nut \
 && chown nut:nut /var/run/nut

COPY . /etc/nut/

RUN chown nut:nut /etc/nut/* \
 && chmod 600 /etc/nut/* \
 && mv /etc/nut/entrypoint.sh /bin/entrypoint \
 && chmod +x /bin/entrypoint

ENTRYPOINT ["/bin/entrypoint"]