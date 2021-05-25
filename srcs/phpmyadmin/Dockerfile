FROM alpine

RUN apk update
RUN apk add nginx php7-fpm php7-mysqli php7-json php7-iconv php7-xml php7-session telegraf

RUN mkdir -p /run/nginx
RUN mkdir -p /run/php
RUN mkdir -p /var/www/phpmyadmin
RUN mkdir -p /cert

COPY phpmyadmin.tar.gz /var/www
RUN tar xzf /var/www/phpmyadmin.tar.gz --strip-components=1 -C /var/www/phpmyadmin ; rm var/www/phpmyadmin.tar.gz

COPY ./cert/server.crt /cert/.
COPY ./cert/server.key /cert/.
COPY nginx.conf /etc/nginx/nginx.conf
COPY www.conf /etc/php7/php-fpm.d/www.conf
COPY telegraf.conf /etc/telegraf.conf

COPY config.inc.php /var/www/phpmyadmin
RUN rm /var/www/phpmyadmin/config.sample.inc.php

CMD telegraf --config /etc/telegraf.conf & php-fpm7 & nginx -g 'daemon off;'
