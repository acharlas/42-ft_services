FROM alpine

RUN apk update
RUN apk add mysql mysql-client
RUN mkdir -p /run/mysqld

RUN mysql_install_db -u root --datadir=/var/lib/mysql --skip-test-db
COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY init.sql /
RUN mysqld -u root & sleep 2 && mysql < init.sql && exit

COPY start.sh start.sh
RUN tar czf datadir.gz -C /var/lib/ mysql
VOLUME /var/lib/mysql

CMD ["/bin/ash", "start.sh"]