FROM alpine

RUN apk update
RUN apk add vsftpd
RUN apk add telegraf

RUN mkdir -p /var/ftp
RUN mkdir -p /cert
RUN adduser --home=/var/ftp -D ftp_admin && echo 'ftp_admin:admin' | chpasswd

COPY ./cert/server.crt /cert/.
COPY ./cert/server.key /cert/.
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY telegraf.conf /etc/telegraf.conf

CMD telegraf --config /etc/telegraf.conf & vsftpd /etc/vsftpd/vsftpd.conf && tail -f /dev/null