FROM alpine:latest

RUN apk add --no-cache \
        ca-certificates \
        libuuid \
        apr \
        apr-util \
        libjpeg-turbo \
        icu \
        icu-libs \
        geoip \
        pcre \
        bash \
        curl

RUN set -x && \
    apk --no-cache add -t .build-deps \
        make \
        wget \
        git \
        automake \
        autoconf \
        zlib-dev \
        geoip-dev \
        apache2-dev \
        apr-dev \
        apr-util-dev \
        build-base \
        icu-dev \
        libjpeg-turbo-dev \
        linux-headers \
        gperf \
        pcre-dev \
        python3 \
        zlib-dev

add build-nginx /usr/src/build-nginx
run chmod 755 /usr/src/build-nginx

run cd /usr/src && ./build-nginx

run apk del .build-deps && \
        rm -rf /tmp/*

#CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
CMD ["bash", "-c", "touch /tmp/xxx; tail -f /tmp/xxx" ]

