#!/bin/sh

cd "$(dirname "$0")"

docker build --platform=linux/amd64 -t rocky-kernel-lts .
