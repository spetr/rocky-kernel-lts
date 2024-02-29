#!/bin/sh

docker run \
    --platform=linux/amd64 -it --rm \
    -v $PWD/rpmbuild:/root/rpmbuild \
    -e KERNEL_VERSION=6.6.18 \
    -e ZFS_VERSION=2.2.3 \
    rocky-kernel-lts
