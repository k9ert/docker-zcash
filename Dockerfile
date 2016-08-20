FROM debian:latest
MAINTAINER Lars-Magnus Skog <ralphtheninja@riseup.net>

ENV GIT_URL https://github.com/zcash/zcash.git
ENV ZCASH_VERSION zc.v0.11.2.z8
ENV ZCASH_HOME /root/.zcash/
ENV ZCASH_CONF /root/.zcash/zcash.conf

RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install build-essential pkg-config libgtest-dev libc6-dev m4 \
    g++-multilib autoconf libtool ncurses-dev unzip git python \
    zlib1g-dev wget bsdmainutils

RUN echo "check_certificate = off" > /root/.wgetrc && mkdir -p /opt/code/; cd /opt/code; \
    git clone ${GIT_URL} zcash && cd zcash && git checkout ${ZCASH_VERSION} && \
    ./zcutil/fetch-params.sh && ./zcutil/build.sh -j$(nproc) && cd /opt/code/zcash/src && \
    /usr/bin/install zcashd zcash-cli -t /usr/local/bin/ && \
    rm -rf /opt/code/

RUN PASS=$(head /dev/urandom | sha256sum | cut -c1-66); mkdir -p ${ZCASH_HOME}; \
    printf '%s\n%s\n%s\n%s\n%s\n' "rpcuser=zcashrpc" "rpcpassword=${PASS}" \
    "testnet=1" "addnode=alphatestnet.z.cash" "gen=1" >> ${ZCASH_CONF}

CMD ["/usr/local/bin/zcashd"]
