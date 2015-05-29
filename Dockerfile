FROM ubuntu:trusty
MAINTAINER Vladimir Krivosheev <develar@gmail.com>

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx" >> /etc/apt/sources.list

ENV NGINX_VERSION 1.9.1-1~trusty

RUN apt-get update && \
    apt-get install -y ca-certificates nginx=${NGINX_VERSION} && \
    rm -rf /var/lib/apt/lists/*

ADD https://github.com/h5bp/server-configs-nginx/raw/master/mime.types /etc/nginx/mime.types
COPY nginx.conf /etc/nginx/nginx.conf
COPY ssl.conf /etc/nginx/ssl.conf
COPY site.conf /sites/site.conf

EXPOSE 80 443

ENTRYPOINT ["nginx"]