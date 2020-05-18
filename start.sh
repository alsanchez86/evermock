#!/bin/sh
echo "Evermock is starting..."
echo "Evermock (1/5) - Checking network..."

exits=$(docker network ls | grep evermock)

if [ -z "$exits" ]; then
    echo "Evermock (2/5) - Creating network..."
    docker network create evermock
else
    echo "Evermock (2/5) - Network already exists"
fi

echo "Evermock (3/5) - Stopping running services..."
docker-compose down

echo "Evermock (4/5) - Starting services..."
docker-compose up -d --remove-orphans