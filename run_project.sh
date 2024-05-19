#!/bin/bash

JAR_FILE="h2-1.4.196.jar"
DOCKER_COMPOSE_FILE="docker-compose.yml"

cd h2/bin

if [ ! -f "$JAR_FILE" ]; then
  echo "Error: $JAR_FILE not found!"
  exit 1
fi

echo "Running the .jar file..."
java -jar $JAR_FILE &

sleep 5
cd ..
cd ..
echo "Opening Docker Desktop..."
open -a Docker

echo "Waiting for Docker Desktop to start..."
while ! docker system info > /dev/null 2>&1; do
  sleep 1
done

if [ ! -f "$DOCKER_COMPOSE_FILE" ]; then
  echo "Error: $DOCKER_COMPOSE_FILE not found!"
  exit 1
fi

echo "Running docker-compose up..."
docker-compose up

