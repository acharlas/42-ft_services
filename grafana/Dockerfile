FROM alpine:latest
LABEL maintainer="acharlas@student.42.fr"
RUN apk update && \
	apk add --no-cache grafana telegraf
COPY telegraf.conf /etc/telegraf.conf
COPY grafana.gz grafana.gz
RUN tar xzf grafana.gz --strip-component=1 -C /usr/share/grafana && rm -rf grafana.gz
CMD telegraf --config /etc/telegraf.conf & grafana-server --homepath="/usr/share/grafana"
