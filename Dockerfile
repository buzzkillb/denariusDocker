FROM armhf/ubuntu as builder
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
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/carsenk/denarius && \
    cd denarius && \
    git checkout v3.4 && \
    git pull && \
    cd src && \
    make -f makefile.arm && \
    strip denariusd

FROM armhf/ubuntu

RUN apt-get update && apt-get -qy install \
    automake \
    build-essential \
    libssl-dev \
    libdb++-dev \
    libboost-all-dev \
    libqrencode-dev \
    libminiupnpc-dev \
    libevent-dev \
    libtool

RUN apt-get update && apt-get -qy install git nano curl wget build-essential

RUN mkdir -p /data

VOLUME ["/data"]

COPY --from=builder /denarius/src/denariusd /usr/local/bin/

EXPOSE 9089 9999 33369

ENTRYPOINT ["denariusd", "--datadir=/data", "--printtoconsole"]
