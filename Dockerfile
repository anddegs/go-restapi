# Use a lightweight Go image for building the binary
FROM golang:1.23-alpine AS builder

ENV GO111MODULE=on

# Set working directory
WORKDIR /app

# Copy go.mod and go.sum files and download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the entire project
COPY . .

# Build the binary, specifying the main file in the cmd/api directory
RUN go build -o main ./cmd/api

# Use a smaller image to run the binary
FROM alpine:latest

# Set working directory
WORKDIR /root/

# Copy the binary from the builder stage
COPY --from=builder /app/main .

# Expose port 8080 (or your app's specific port)
EXPOSE 8080


# Run the Go binary
CMD ["./main", "-dsn=host=192.168.1.51 port=5432 user=postgres password=postgres dbname=movies sslmode=disable timezone=UTC connect_timeout=5"]

