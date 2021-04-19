FROM alpine
RUN apk update

RUN apk add nginx
RUN mkdir /cert
RUN mkdir -p /run/nginx

COPY ./cert/server.crt /cert/.
COPY ./cert/server.key /cert/.
#COPY nginx.conf /etc/nginx/nginx.conf


#CMD nginx -g 'daemon off;'