#!/usr/bin/env bash

docker buildx build --platform=linux/amd64,linux/arm64/v8 --tag public.ecr.aws/rpungello/nut-dummy --push .

