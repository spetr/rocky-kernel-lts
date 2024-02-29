#!/bin/sh

if [ -z "${KERNEL_VERSION}" ]; then
    echo "KERNEL_VERSION is not set"
    exit 1
fi

if [ -z "${ZFS_VERSION}" ]; then
    echo "ZFS_VERSION is not set"
    exit 1
fi

# Download kernel sources
if [ ! -f /root/rpmbuild/SOURCES/linux-${KERNEL_VERSION}.tar.xz ]; then
    wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${KERNEL_VERSION}.tar.xz -O /root/rpmbuild/SOURCES/linux-${KERNEL_VERSION}.tar.xz
fi

# Download ZFS sources
if [ ! -f /root/rpmbuild/SOURCES/zfs-${ZFS_VERSION}.tar.gz ]; then
    wget https://github.com/openzfs/zfs/releases/download/zfs-${ZFS_VERSION}/zfs-${ZFS_VERSION}.tar.gz -O /root/rpmbuild/SOURCES/zfs-${ZFS_VERSION}.tar.gz
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
rpm -i zfs-${ZFS_VERSION}-1.el9.src.rpm zfs-kmod-${ZFS_VERSION}-1.el9.src.rpm

cd /root
rpmbuild -ba /root/rpmbuild/SPECS/zfs.spec
rpmbuild -ba /root/rpmbuild/SPECS/zfs-kmod.spec
