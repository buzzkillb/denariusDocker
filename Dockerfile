FROM armhf/ubuntu as builder
COPY qemu-arm-static /usr/bin
RUN apt-get update && apt-get -qy install \
    git \
    nano \
    curl \
    wget \
    build-essential \
    build-essential \
    libssl-dev \
    libdb++-dev \
    libboost-all-dev \
    libqrencode-dev \
    libminiupnpc-dev \
    libevent-dev \
    autogen \
    automake \
    libtool \
    make \
    libcurl4-openssl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/carsenk/denarius && \
    cd denarius && \
    git pull && \
    cd src && \
    make -f makefile.arm && \
    strip denariusd

FROM armhf/ubuntu
COPY qemu-arm-static /usr/bin

RUN apt-get update && apt-get -qy install \
    automake \
    build-essential \
    libssl-dev \
    libdb++-dev \
    libboost-all-dev \
    libqrencode-dev \
    libminiupnpc-dev \
    libevent-dev \
    libcurl4-openssl-dev \
    libtool

RUN apt-get update && apt-get -qy install git nano curl wget build-essential

RUN mkdir -p /data

VOLUME ["/data"]

COPY --from=builder /denarius/src/denariusd /usr/local/bin/

EXPOSE 9089 9999 33369 32369

ENTRYPOINT ["denariusd", "--datadir=/data", "--printtoconsole"]
