FROM ghcr.io/astral-sh/uv:python3.11-alpine
WORKDIR /app

# Install system dependencies (Alpine uses apk, not apt-get)
RUN apk add --no-cache \
    git \
    wget \
    unzip \
    gcc \
    g++ \
    make \
    musl-dev \
    python3-dev \
    linux-headers

# Download and extract the repository files


# Copy dependency files
COPY pyproject.toml ./

# Install dependencies using uv
RUN uv lock
RUN uv sync --frozen --no-dev --no-install-project

## TODO
