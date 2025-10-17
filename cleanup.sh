#!/bin/bash

echo "🧹 Cleaning up Docker containers, volumes, and network..."

# Stop and remove containers if they exist - || && means run if the previous succeeded
docker stop server 2>/dev/null && echo "Stopped server container."
docker rm server 2>/dev/null && echo "Removed server container."
docker stop client 2>/dev/null && echo "Stopped client container."
docker rm client 2>/dev/null && echo "Removed client container."

# Remove network if it exists
docker network rm mynet 2>/dev/null && echo "Removed network 'mynet'."

# Remove volumes if they exist
docker volume rm servervol 2>/dev/null && echo "Removed volume 'servervol'."
docker volume rm clientvol 2>/dev/null && echo "Removed volume 'clientvol'."

echo "✅ Cleanup complete!"
