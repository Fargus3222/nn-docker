FROM rust AS build


ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /build

COPY . .

RUN apt update && apt upgrade -y && apt install curl  \
 iptables \
 build-essential  \
 git  \
 wget  \
 lz4  \
 jq  \
 make \
 gcc \
 automake \
 autoconf \
 nvme-cli \
 pkg-config \
 libssl-dev \
 libleveldb-dev \
 tar \
 clang \
 bsdmainutils \
 unzip \
 libleveldb-dev  -y 

RUN chmod 755 /build/run.sh && \
    chmod 755 /build/install.sh && \
    /build/install.sh && mkdir -p $HOME/.nexus/ && \
    touch $HOME/.nexus/prover-id

FROM rust

WORKDIR /app

COPY --from=build /build /app

RUN chmod 755 /app/run.sh

ENTRYPOINT /app/run.sh
