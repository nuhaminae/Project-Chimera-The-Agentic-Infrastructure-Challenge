# Project Chimera Makefile

IMAGE_NAME=chimera-agent
CONTAINER_NAME=chimera-test

# Setup: build Docker image and install dependencies
setup:
    docker build -t $(IMAGE_NAME) .

# Test: run failing tests inside Docker
test:
    docker run --rm -v $(PWD):/app $(IMAGE_NAME) pytest tests/

# Spec-check: optional script to verify code aligns with specs
spec-check:
    @echo "Running spec alignment check..."
    @grep -R "Ref: specs" skills/ src/ || echo "No spec references found"
