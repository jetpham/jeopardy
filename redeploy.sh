#!/usr/bin/env bash

CONTAINER="jeopardy"
IMAGE="jeopardy-image"

if [ `docker ps -q --filter "name=$CONTAINER"` ]; then
    docker kill $CONTAINER
fi
if [ `docker ps -aq --filter "name=$CONTAINER"` ]; then
    docker rm $CONTAINER
fi
if [ `ls | grep Dockerfile` ]; then
    docker build --tag="$IMAGE" .
fi
docker run -dP -p 3000:3000 --name="$CONTAINER" $IMAGE
