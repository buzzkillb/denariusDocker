FROM ubuntu:18.04 as builder

LABEL author="buzzkillb"

RUN apt-get update && apt-get install -y \
    git \
    wget \
    unzip \
    automake \
    build-essential \
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
 
RUN wget https://www.openssl.org/source/openssl-1.0.1j.tar.gz && \
    tar -xzvf openssl-1.0.1j.tar.gz && \
    cd openssl-1.0.1j && \
    ./config && \
    make install && \
    ln -sf /usr/local/ssl/bin/openssl `which openssl` && \
    cd ~
    
RUN git clone https://github.com/carsenk/denarius && \
    cd denarius && \
    git checkout v3.4 && \
    git pull && \
    cd src && \
    OPENSSL_INCLUDE_PATH=/usr/local/ssl/include OPENSSL_LIB_PATH=/usr/local/ssl/lib make -f makefile.unix && \
    strip denariusd

# final image
FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \	
    automake \	
    build-essential \	
    libdb++-dev \	
    libboost-all-dev \	
    libqrencode-dev \	
    libminiupnpc-dev \	
    libevent-dev \	
    libtool \	
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /data

VOLUME ["/data"]

COPY --from=builder /usr/local/ssl/bin/openssl /usr/local/ssl/bin/openssl
COPY --from=builder /denarius/src/denariusd /usr/local/bin/

EXPOSE 9089 9999 33369

ENTRYPOINT ["denariusd", "--datadir=/data", "--printtoconsole"]
