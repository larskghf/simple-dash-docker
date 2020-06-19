FROM debian:buster-slim as downloader

ARG SIMPLE_DASH_DL_URL

WORKDIR /tmp

RUN apt-get update \
    && apt-get install -y --no-install-recommends unzip wget \
    && rm -rf /var/lib/apt/lists/* \
    && wget ${SIMPLE_DASH_DL_URL} \
    && unzip master.zip \
    && mkdir /tmp/simple-dash \
    && mv -t /tmp/simple-dash /tmp/simple-dash-master/common/ /tmp/simple-dash-master/config.json /tmp/simple-dash-master/favicon.ico /tmp/simple-dash-master/index.html

#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
FROM nginx:1.17

MAINTAINER larskghf <lars@kghf.io>

COPY --from=downloader /tmp/simple-dash /usr/share/nginx/html