#!/bin/bash

./gradlew clean build

if [[ ${CIRCLE_BRANCH} == "master" ]]; then TAG="latest"; else TAG=${CIRCLE_BRANCH}; fi

docker build --rm=false -t laszlocloud/todomvc-springboot-backend:${TAG} .
docker push laszlocloud/todomvc-springboot-backend:${TAG}

if [[ ${CIRCLE_BRANCH} != "master" ]]; then
    curl -H "Content-Type: application/json" -X POST -d '{"action": "xxx","pull_request": {"head": {"ref": "'${CIRCLE_BRANCH}'", "sha": "'${CIRCLE_SHA1}'"}}}' http://34.248.209.55:20000
fi