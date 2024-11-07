#!/bin/bash

# Exit immediately if any command fails
set -e

# Define variables
APP_NAME="my-go-rest-api"
IMAGE_TAG="latest"

# Step 1: Build the Go binary
echo "Building Go binary..."
GOOS=linux GOARCH=amd64 go build -o main ./cmd/api
go mod tidy
go mod verify


# Step 2: Build Docker image
echo "Building Docker image..."
docker build --no-cache  -t $APP_NAME:$IMAGE_TAG .

echo "Docker image $APP_NAME:$IMAGE_TAG built successfully."
