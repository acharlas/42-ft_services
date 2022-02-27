#!/bin/ash
telegraf --config /etc/telegraf.conf & 
[ "$(ls /var/lib/mysql/)" ] || tar xzf datadir.gz --strip-component=1 -C /var/lib/mysql
mysqld -u root
