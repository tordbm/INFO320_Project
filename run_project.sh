#!/bin/bash

# Define constants
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
JAR_FILE="h2-1.4.196.jar"
DOCKER_COMPOSE_FILE="docker-compose.yml"
FRONTEND_PATH="../INFO320_frontend"

# Navigate to the script directory
cd "$SCRIPT_DIR" || { echo "Failed to navigate to script directory"; exit 1; }

# Check if the JAR file exists in h2/bin directory
if [ ! -d "h2/bin" ]; then
  echo "Error: h2/bin directory not found!"
  exit 1
fi

cd h2/bin || { echo "Failed to navigate to h2/bin directory"; exit 1; }

if [ ! -f "$JAR_FILE" ]; then
  echo "Error: $JAR_FILE not found!"
  exit 1
fi

echo "Running the .jar file..."
java -jar "$JAR_FILE" &
JAR_PID=$!
sleep 3

echo "Navigating to frontend directory..."
cd ../..


echo "Running npm install and npm run dev in a new Terminal window..."
osascript <<EOF
tell application "Terminal"
    do script "cd $(cd "$FRONTEND_PATH" && pwd);npm install && npm run dev"
end tell
EOF
echo "npm commands executed in new Terminal window."

# Navigate back to the script directory
cd "$SCRIPT_DIR" || { echo "Failed to navigate back to script directory"; exit 1; }

# Open Docker Desktop
if ! open -Ra "Docker"; then
  echo "Error: Docker Desktop not found!"
  kill $JAR_PID
  exit 1
fi

echo "Opening Docker Desktop..."
open -a Docker

echo "Waiting for Docker Desktop to start..."
while ! docker system info > /dev/null 2>&1; do
  sleep 1
done

# Check if the docker-compose file exists
if [ ! -f "$DOCKER_COMPOSE_FILE" ]; then
  echo "Error: $DOCKER_COMPOSE_FILE not found!"
  kill $JAR_PID
  exit 1
fi

echo "Running docker-compose up..."
docker-compose up

# Cleanup
trap "kill $JAR_PID" EXIT
