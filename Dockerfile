FROM rust AS build

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /build

COPY . .

RUN apt update && apt upgrade -y && apt install -y \
    curl \
    iptables \
    build-essential \
    git \
    wget \
    lz4 \
    jq \
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
    unzip

RUN chmod 755 /build/run.sh && \
    chmod 755 /build/install.sh && \
    /build/install.sh && \
    mkdir -p $HOME/.nexus/ && \
    touch $HOME/.nexus/prover-id


RUN useradd -m -s /bin/bash nexus && \
    chown -R nexus:nexus /build

FROM rust

WORKDIR /app

COPY --from=build /build /app

RUN useradd -m -s /bin/bash nexus

RUN chmod 755 /app/run.sh

USER nexus

ENTRYPOINT ["/app/run.sh"]