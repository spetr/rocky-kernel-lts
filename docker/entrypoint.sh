#!/bin/sh

KERNEL_VERSION="6.6.17"
ZFS_VERSION="2.2.2"

if [ ! -f /root/rpmbuild/SOURCES/linux-${KERNEL_VERSION}.tar.xz ]; then
    wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${KERNEL_VERSION}.tar.xz -O /root/rpmbuild/SOURCES/linux-${KERNEL_VERSION}.tar.xz
fi

if [ ! -f /root/rpmbuild/SOURCES/zfs-${ZFS_VERSION}.tar.gz ]; then
    wget https://github.com/openzfs/zfs/releases/download/zfs-2.2.2/zfs-2.2.2.tar.gz -O /root/rpmbuild/SOURCES/zfs-${ZFS_VERSION}.tar.gz
fi

# Build kernel
cd /root
rpmbuild -ba /root/rpmbuild/SPECS/kernel-lts-6.6.spec

# Build ZFS
cd /root
rpm -i /root/rpmbuild/RPMS/x86_64/kernel-lts-devel-${KERNEL_VERSION}-1.el9.x86_64.rpm
tar -xf /root/rpmbuild/SOURCES/zfs-${ZFS_VERSION}.tar.gz -C /tmp
cd /tmp/zfs-${ZFS_VERSION}
./configure
make srpm-utils srpm-kmod
rpm -i zfs-2.2.2-1.el9.src.rpm zfs-kmod-2.2.2-1.el9.src.rpm

cd /root
rpmbuild -ba /root/rpmbuild/SPECS/zfs.spec
rpmbuild -ba /root/rpmbuild/SPECS/zfs-kmod.spec
