FROM alpine

RUN apk update 
RUN apk add influxdb telegraf
COPY init.influx init.influx
COPY telegraf.conf /etc/telegraf.conf

RUN influxd -config /etc/influxdb.conf & sleep 5 && influx < init.influx
RUN tar czf influxdir.gz -C /var/lib influxdb
COPY start.sh start.sh

VOLUME /var/lib/mysql
CMD ["/bin/ash", "start.sh"]