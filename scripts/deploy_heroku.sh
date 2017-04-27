#!/bin/bash

set -e

docker pull $DOCKER_IMAGE
docker tag $DOCKER_IMAGE $HEROKU_IMAGE
docker push $HEROKU_IMAGE
