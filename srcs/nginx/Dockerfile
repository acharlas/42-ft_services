FROM alpine
RUN apk update

RUN apk add nginx telegraf
RUN mkdir -p /cert
RUN mkdir -p /run/nginx

COPY ./cert/server.crt /cert/.
COPY ./cert/server.key /cert/.
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /var/www/.
COPY telegraf.conf /etc/telegraf.conf

CMD telegraf --config /etc/telegraf.conf & nginx -g 'daemon off;'