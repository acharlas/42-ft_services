FROM alpine:latest

RUN apk update
RUN apk add vsftpd
RUN mkdir -p /var/ftp
RUN mkdir -p /cert
RUN adduser --home=/var/ftp -D ftp_admin && echo 'ftp_admin:admin' | chpasswd

COPY ./cert/server.crt /cert/.
COPY ./cert/server.key /cert/.
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

CMD vsftpd /etc/vsftpd/vsftpd.conf

