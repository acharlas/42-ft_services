FROM alpine

RUN apk update
RUN apk add telegraf grafana
RUN mkdir -p /var/www/grafana

COPY telegraf.conf /etc/telegraf.conf
COPY grafana.gz grafana.gz
RUN tar xzf grafana.gz --strip-component=1 -C /var/www/grafana && rm -rf grafana.gz
CMD telegraf --config /etc/telegraf.conf & grafana-server --homepath="/var/www/grafana"