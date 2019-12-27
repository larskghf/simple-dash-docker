FROM larskghf/debian-baseimage:latest as downloader

ARG SIMPLE_DASH_DL_URL

WORKDIR /tmp

RUN apt-get update \
    && apt-get install -y --no-install-recommends unzip wget \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://github.com/kutyla-philipp/simple-dash/archive/master.zip \
    && unzip master.zip \
    && mkdir /tmp/simple-dash \
    && mv -t /tmp/simple-dash /tmp/simple-dash-master/common/ /tmp/simple-dash-master/config.json /tmp/simple-dash-master/favicon.ico /tmp/simple-dash-master/index.html

#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
FROM nginx:1.17

COPY --from=downloader /tmp/simple-dash /usr/share/nginx/html