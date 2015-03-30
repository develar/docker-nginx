FROM alpine:3.1
MAINTAINER Vladimir Krivosheev <develar@gmail.com>

RUN apk add --update ca-certificates nginx && mkdir /tmp/nginx && rm -rf /var/cache/apk/*

ADD https://github.com/h5bp/server-configs-nginx/raw/master/mime.types /etc/nginx/mime.types
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

ENTRYPOINT ["nginx"]