#!/bin/bash

COLLECTION="aico"
IMAGE="aico2caom2_app"

echo "Get a proxy certificate"
cp $HOME/.ssl/cadcproxy.pem ./ || exit $?

echo "Get image ${IMAGE}"
docker pull ${IMAGE}

echo "Run image ${IMAGE}"
docker run --rm --name ${COLLECTION}_state  --user $(id -u):$(id -g) -e HOME=/usr/src/app -v ${PWD}:/usr/src/app/ ${IMAGE} ${COLLECTION}_run_state || exit $?

date
exit 0
