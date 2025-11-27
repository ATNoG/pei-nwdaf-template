FROM ghcr.io/astral-sh/uv:python3.11-bookworm-slim
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Download and extract the repository files
RUN wget https://github.com/ATNoG/pei-nwdaf-comms/archive/refs/heads/main.zip -O repo.zip && \
    unzip repo.zip "pei-nwdaf-comms-main/kafka/src/*" -d /tmp && \
    mkdir -p /app/utils && \
    mv /tmp/pei-nwdaf-comms-main/kafka/src/* /app/utils/ && \
    rm -rf repo.zip /tmp/pei-nwdaf-comms-main

# Copy dependency files
COPY pyproject.toml uv.lock* ./

# Install dependencies using uv
RUN uv sync --frozen --no-dev

# TODO
