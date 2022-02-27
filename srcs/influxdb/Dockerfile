FROM alpine:latest
LABEL maintainer="acharlas@student.42.fr"
RUN apk update && \
	apk add --no-cache influxdb telegraf
COPY init.influx /init.influx
COPY telegraf.conf /etc/telegraf.conf
# Set up database
RUN influxd -config /etc/influxdb.conf & sleep 1 && influx < init.influx
RUN tar czf influxdir.gz -C /var/lib influxdb
COPY start.sh start.sh
VOLUME /var/lib/influxdb
EXPOSE 8086
CMD ["/bin/ash", "start.sh"]
