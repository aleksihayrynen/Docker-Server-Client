#!/bin/bash

# Create network and volume if missing &> removes the outputs - || means if the left one fails do the right one
docker network inspect mynet &>/dev/null || docker network create mynet
docker volume inspect servervol &>/dev/null || docker volume create clientvol

ADDRESS=${1:-0.0.0.0}
PORT=${2:-5000}


# Build and run client
docker build -t pyclient ./client
docker run --rm \
  --name client \
  --network mynet \
  -v clientvol:/clientdata \
  -e SERVER_PORT=$PORT \
  -e SERVER_ADDRESS=$ADDRESS \
  pyclient

echo "Connecting: ${ADDRESS}:${PORT}"