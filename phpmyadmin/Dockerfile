FROM alpine:latest
LABEL maintainer="acharlas@student.42.fr"
RUN apk update
RUN apk add nginx php7-fpm php7-mysqli php7-json php7-iconv php7-xml php7-session telegraf
RUN mkdir -p /run/nginx /run/php
RUN mkdir -p /var/www/phpmyadmin

COPY phpmyadmin.tar.gz /var/www
RUN tar xzf /var/www/phpmyadmin.tar.gz --strip-components=1 -C /var/www/phpmyadmin ; rm var/www/phpmyadmin.tar.gz

COPY telegraf.conf /etc/telegraf.conf

COPY cert.pem /etc/ssl/certs/cert.pem
COPY key.pem /etc/ssl/private/key.pem

COPY nginx.conf /etc/nginx/nginx.conf
COPY test.conf /etc/nginx/test.conf
COPY www.conf /etc/php7/php-fpm.d/www.conf

RUN rm /var/www/phpmyadmin/config.sample.inc.php
COPY config.inc.php /etc/phpmyadmin/config.inc.php
CMD telegraf --config /etc/telegraf.conf & php-fpm7 && nginx -g 'daemon off;'
