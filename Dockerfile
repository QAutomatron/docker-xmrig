FROM alpine

MAINTAINER Acris Liu "acrisliu@gmail.com"

ENV XMRIG_VERSION v2.4.3

RUN set -ex \
    && adduser -S -D -H -h /home/xmrig xmrig \
    && apk add --no-cache --virtual .build-deps \
           git \
           cmake \
           build-base \
    && apk add --no-cache libuv-dev libmicrohttpd-dev \
    && cd /tmp \
    && git clone https://github.com/xmrig/xmrig \
    && cd xmrig \
    && git checkout "$XMRIG_VERSION" \
    && sed -i -e 's/constexpr const int kDonateLevel = 5;/constexpr const int kDonateLevel = 0;/g' src/donate.h \
    && mkdir build \
    && cd build \
    && cmake .. -DCMAKE_BUILD_TYPE=Release \
    && make \
    && cp xmrig /home/xmrig \
    && cd / \
    && rm -rf /tmp/xmrig \
    && apk del .build-deps

USER xmrig

WORKDIR /home/xmrig

ENTRYPOINT ["./xmrig"]
