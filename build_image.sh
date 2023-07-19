#!/bin/bash

ECR_HOST=<AWS_ACCOUNT_ID>.dkr.ecr.<AWS_REGION>.amazonaws.com
REPO=rus-temp
IMAGE_TAG=test

aws ecr get-login-password | docker login --username AWS --password-stdin ${ECR_HOST}

docker buildx build --platform=linux/amd64  --no-cache --tag ${ECR_HOST}/${REPO}:${IMAGE_TAG} .
docker push ${ECR_HOST}/${REPO}:${IMAGE_TAG}