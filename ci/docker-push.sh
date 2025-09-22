#!/bin/bash

set -e
DOCKERHUB_REPOSITORY=qapropeller/selenoid

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker buildx build --pull --push -t "$DOCKERHUB_REPOSITORY:$1" --platform linux/amd64,linux/arm64 .
