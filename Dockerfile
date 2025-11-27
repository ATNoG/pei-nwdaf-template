FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/ATNoG/pei-nwdaf-comms/archive/refs/heads/main.zip -O repo.zip && \
    unzip repo.zip "pei-nwdaf-comms-main/kafka/src/*" -d /tmp && \
    mkdir -p /app/utils && \
    mv /tmp/pei-nwdaf-comms-main/kafka/src/* /app/utils/ && \
    rm -rf repo.zip /tmp/pei-nwdaf-comms-main

# TODO
