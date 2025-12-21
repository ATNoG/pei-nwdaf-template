# pei-nwdaf-template

> Project for PEI evaluation 25/26

## Overview

Standardized template repository for creating new microservices and components as part of the PEI NWDAF project infrastructure. Provides boilerplate setup for consistent development, deployment, and CI/CD practices across the organization.

## Purpose

This template ensures:
- Consistent project structure across all NWDAF services
- Pre-configured CI/CD pipeline (Jenkins + GitHub Actions)
- Docker containerization standards
- Kafka integration setup
- Security scanning and code quality checks
- Environment management best practices

## Technologies

- **Python** 3.13 - Primary language
- **FastAPI** 0.121.3 - Web framework for building APIs
- **Pydantic** 2.12.4 - Data validation and serialization
- **Uvicorn** 0.34.0 - ASGI application server
- **Apache Kafka/Confluent Kafka** 2.12.2 - Message streaming/event processing
- **Docker** - Containerization
- **Docker Compose** - Multi-container orchestration
- **Jenkins** - CI/CD pipeline automation
- **GitHub Actions** - Workflow automation triggers
- **Bandit** - Security vulnerability scanner
- **Safety** - Dependency vulnerability scanner

## Key Features

1. **Containerization**: Docker-based deployment with Python 3.13 slim image from `ghcr.io/astral-sh/uv`
2. **CI/CD Pipeline**:
   - GitHub Actions workflow triggers Jenkins on pushes to `main` branch
   - Jenkins pipeline with stages:
     - Environment preparation
     - Infrastructure deployment
     - Verification
3. **Kafka Integration**: Pre-configured Kafka utilities pulled from `pei-nwdaf-comms` repository during Docker build
4. **Network Isolation**: Services run on external `nwdaf-network` for inter-service communication
5. **Security & Code Quality**:
   - Bandit security checker
   - Safety dependency vulnerability scanner
6. **Environment Management**: Centralized `.env` file handling with Jenkins credentials

## Quick Start

1. Clone this template repository
2. Update service-specific configuration
3. Customize `requirements.txt` with your dependencies
4. Implement your service logic
5. Push to GitHub (triggers CI/CD)

## Setup Jenkins

1. Configure self-hosted runner
2. Add required secrets to Jenkins
3. Update `jenkins.yml` workflow file
4. Add tests to Jenkinsfile

## Docker

```bash
docker-compose up --build
```

## Directory Structure

```
template/
├── Dockerfile           # Container build configuration
├── docker-compose.yml   # Service orchestration
├── Jenkinsfile         # CI/CD pipeline definition
├── requirements.txt    # Python dependencies
├── .env                # Environment variables
├── .gitignore          # Git exclusions
└── .github/
    └── workflows/
        └── jenkins.yml # GitHub Actions trigger
```

## Network Configuration

All services connect to external Docker network: `nwdaf-network`

## Best Practices

- Follow existing service patterns (ingestion, processor, ml, storage)
- Maintain consistent naming conventions
- Add comprehensive tests
- Document API endpoints
- Use environment variables for configuration
- Implement health check endpoints
- Add proper logging
