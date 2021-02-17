#!/usr/bin/env bash
set -e
./gradlew -p ./monolithic/ui packageToContainer
docker tag zutherb/monolithic-shop:latest $DOCKER_LOGIN/monolithic-shop:latest
echo \"${DOCKER_PASSWORD}\" | docker login --username \${DOCKER_LOGIN}\" --password-stdin
docker push $DOCKER_LOGIN/monolithic-shop:latest