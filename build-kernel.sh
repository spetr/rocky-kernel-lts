#!/bin/sh

docker run --platform=linux/amd64 -it --rm -v $PWD/rpmbuild:/root/rpmbuild rocky-kernel-lts
