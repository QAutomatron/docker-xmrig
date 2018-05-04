FROM alpine

MAINTAINER QAutomatron

ENV XMRIG_VERSION v2.5.3

RUN set -ex \
    && adduser -S -D -h /home/xmrig xmrig \
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
    && cd /home/xmrig \
    && rm -rf /tmp/xmrig \
    && apk del .build-deps

USER xmrig

WORKDIR /home/xmrig

ENTRYPOINT ["./xmrig"]
