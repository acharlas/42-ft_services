FROM alpine

RUN apk update
RUN apk add nginx php7-fpm php7-mysqli php7-json telegraf
RUN mkdir -p /run/nginx
RUN mkdir -p /run/php

COPY wordpress.tar.gz /var/www
RUN tar xzf /var/www/wordpress.tar.gz -C /var/www ; rm var/www/wordpress.tar.gz

COPY nginx.conf /etc/nginx/nginx.conf
COPY www.conf /etc/php7/php-fpm.d/www.conf
COPY wp-config.php /var/www/wordpress/.
COPY telegraf.conf /etc/telegraf.conf
RUN rm /var/www/wordpress/wp-config-sample.php

CMD telegraf --config /etc/telegraf.conf & php-fpm7 & php-fpm7 & nginx -g 'daemon off;'