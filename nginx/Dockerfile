FROM alpine:latest
LABEL maintainer="acharlas@student.42.fr"
# Install and setup nginx
RUN apk update && apk add --no-cache telegraf
RUN apk add nginx && mkdir -p /run/nginx
COPY key.pem /etc/ssl/private/key.pem
COPY cert.pem /etc/ssl/certs/cert.pem
COPY nginx.conf /etc/nginx/nginx.conf
COPY test.conf /etc/nginx/test.conf
COPY index.html /var/www/index.html
COPY telegraf.conf /etc/telegraf.conf
EXPOSE 80
EXPOSE 443
CMD telegraf --config /etc/telegraf.conf & nginx -g 'daemon off;'
