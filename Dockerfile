FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential clang clojure nodejs npm \
    dmd-compiler dub dart erlang \
    golang-go ghc haxe iconx \
    openjdk-17-jdk lua5.4 ocaml \
    perl php-cli python2 python3 ruby \
    rustc scala git wget ca-certificates lsb-release \
    cmake libbz2-dev libreadline-dev libncurses5-dev \
    libssl-dev libffi-dev && \
    npm install -g coffee-script && \
    rm -rf /var/lib/apt/lists/*

# Install HHVM from the official repository
RUN wget -O - https://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add - && \
    echo "deb [arch=amd64] https://dl.hhvm.com/ubuntu $(lsb_release -cs) main" \
        > /etc/apt/sources.list.d/hhvm.list && \
    apt-get update && apt-get install -y --no-install-recommends hhvm && \
    rm -rf /var/lib/apt/lists/*

# Build Io from source
RUN git clone https://github.com/IoLanguage/io.git /tmp/io && \
    cd /tmp/io && \
    ./autogen.sh && ./configure && make && make install && \
    cd / && rm -rf /tmp/io

WORKDIR /app
ENV LANG_ROOT=/app
COPY . /app
CMD ["/app/test-all.sh"]
