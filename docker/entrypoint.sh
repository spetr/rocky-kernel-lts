#!/bin/sh

KERNEL_VERSION="6.6.17"
ZFS_VERSION="2.2.2"

if [ ! -f /root/rpmbuild/SOURCES/linux-${KERNEL_VERSION}.tar.xz ]; then
    wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${KERNEL_VERSION}.tar.xz -O /root/rpmbuild/SOURCES/linux-${KERNEL_VERSION}.tar.xz
fi

if [ ! -f /root/rpmbuild/SOURCES/zfs-${ZFS_VERSION}.tar.gz ]; then
    wget https://github.com/openzfs/zfs/releases/download/zfs-2.2.2/zfs-2.2.2.tar.gz -O /root/rpmbuild/SOURCES/zfs-${ZFS_VERSION}.tar.gz
fi

rpmbuild -ba /root/rpmbuild/SPECS/kernel-lts-6.6.spec
