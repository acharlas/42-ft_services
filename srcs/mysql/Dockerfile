FROM alpine:latest
LABEL maintaier="acharlas@student.42.fr"
RUN apk add --no-cache mysql mysql-client telegraf
RUN mkdir -p /run/mysqld
RUN mysql_install_db -u root --datadir=/var/lib/mysql --skip-test-db
COPY init.sql init.sql
COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
RUN mysqld -u root & sleep 10 && mysql < init.sql && exit
COPY telegraf.conf /etc/telegraf.conf
COPY start.sh start.sh
RUN tar czf datadir.gz -C /var/lib/ mysql
VOLUME /var/lib/mysql
EXPOSE 3306
CMD ["/bin/ash", "start.sh"]
