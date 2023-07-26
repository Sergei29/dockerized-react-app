#!/bin/bash

echo "Starting docker..."

open -a Docker

# Wait until Docker Desktop is started
while ! docker info > /dev/null 2>&1; do
  sleep 1
done

# Run the rest of the script here
echo "Docker Desktop is started and ready to use"
