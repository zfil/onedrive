FROM ubuntu:bionic

RUN apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y -qq git build-essential libcurl4-openssl-dev libsqlite3-dev libnotify-dev pkg-config curl \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

RUN curl -fsS https://dlang.org/install.sh | bash -s dmd
RUN update-alternatives --install "/usr/bin/ld" "ld" "/usr/bin/ld.gold" 20 \
    && update-alternatives --install "/usr/bin/ld" "ld" "/usr/bin/ld.bfd" 10

WORKDIR /root/
RUN git clone https://github.com/abraunegg/onedrive.git \
    && . ~/dlang/dmd-*/activate \
    && cd onedrive \
    && ./configure --enable-notifications --enable-completions \
    && make
