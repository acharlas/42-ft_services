FROM alpine:latest
LABEL maintainer="acharlas@student.42"
RUN apk update && \
	apk add nginx php php-fpm php-mysqli php-json telegraf
RUN mkdir -p /run/nginx /run/php
COPY nginx.conf /etc/nginx/nginx.conf
COPY test.conf /etc/nginx/test.conf
COPY www.conf /etc/php7/php-fpm.d/www.conf
ADD https://wordpress.org/latest.tar.gz .
RUN tar xzf latest.tar.gz -C var/www/ ; rm latest.tar.gz
COPY wp-config.php /var/www/wordpress/wp-config.php
COPY telegraf.conf /etc/telegraf.conf

CMD telegraf --config /etc/telegraf.conf & php-fpm7 && nginx -g 'daemon off;'
