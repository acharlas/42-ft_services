FROM alpine:latest

RUN apk update && \
	apk add --no-cache telegraf
RUN apk add --no-cache vsftpd
RUN mkdir -p /var/ftp
RUN adduser --home=/var/ftp -D ftp_admin && echo 'ftp_admin:admin' | chpasswd

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY key.pem /etc/ssl/private/key.pem
COPY cert.pem /etc/ssl/certs/cert.pem
COPY telegraf.conf /etc/telegraf.conf

EXPOSE 20
EXPOSE 21
EXPOSE 4242
CMD telegraf --config /etc/telegraf.conf & vsftpd /etc/vsftpd/vsftpd.conf && tail -f /dev/null
