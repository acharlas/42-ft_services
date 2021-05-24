#!/bin/ash
telegraf --config /etc/telegraf.conf & 
[ "$(ls /var/lib/influxdb/)" ] || tar xzf datadir.gz --strip-component=1 -C /var/lib/influxdb
influxd -config /etc/influxdb.conf