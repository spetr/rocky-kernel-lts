#!/bin/sh

KERNEL_VERSION="6.6.9"

if [ ! -f /root/rpmbuild/SOURCES/linux-${KERNEL_VERSION}.tar.xz ]; then
    wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${KERNEL_VERSION}.tar.xz -O /root/rpmbuild/SOURCES/linux-${KERNEL_VERSION}.tar.xz
fi

rpmbuild -ba /root/rpmbuild/SPECS/kernel-lts-6.6.spec