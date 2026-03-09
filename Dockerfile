FROM ubuntu:22.04

RUN apt update && \
    apt install -y \
    python3 \
    python3-pip \
    openssh-server \
    tmate \
    curl \
    git \
    vim

WORKDIR /

COPY app /app
COPY scripts /scripts

RUN chmod +x /scripts/*.sh
