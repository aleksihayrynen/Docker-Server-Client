#!/bin/bash

# Create network and volume if missing &> removes the outputs - || means if the left one fails do the right one
docker network inspect mynet &>/dev/null || docker network create mynet
docker volume inspect servervol &>/dev/null || docker volume create servervol

PORT=${1:-5000}
CONTAINER_NAME="server"


# Build and run server
docker build -t pyserver ./server
docker run -d \
  --name $CONTAINER_NAME \
  --network mynet \
  -v servervol:/serverdata \
  -e SERVER_PORT=$PORT \
  pyserver
#   -p 5000:5000 \

echo "Running server on: http://$CONTAINER_NAME:$PORT"


  
   
