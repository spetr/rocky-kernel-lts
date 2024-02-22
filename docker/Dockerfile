FROM --platform=linux/amd64 rockylinux:9

# Install build environment
RUN dnf install -y dnf-plugins-core epel-release
RUN dnf config-manager --set-enabled crb epel
RUN dnf upgrade -y

# Install build dependencies
RUN dnf install -y rpm-build rpmdevtools wget
# Kernel dependencies
RUN dnf install -y \
    asciidoc \
    audit-libs-devel \
    bc \
    binutils-devel \
    bison \
    bpftool \
    dwarves \
    elfutils-devel \
    flex \
    gcc-c++ \
    gcc-plugin-devel \
    gettext \
    git-core \
    glibc-static \
    hmaccalc \
    java-devel \
    kernel-rpm-macros \
    kmod \
    libbabeltrace-devel \
    libbpf-devel \
    libcap-devel \
    libcap-ng-devel \
    libnl3-devel \
    libtraceevent-devel \
    ncurses-devel \
    net-tools \
    newt-devel \
    numactl-devel \
    openssl-devel \
    pciutils-devel \
    perl-ExtUtils-Embed \
    perl-generators \
    python3-devel \
    python3-docutils \
    rsync \
    xmlto
# ZFS dependencies
RUN dnf install -y \
     libtirpc-devel \
     libaio-devel \
     libattr-devel \
     libudev-devel \
     python3-cffi

COPY --chmod=755 entrypoint.sh /

WORKDIR /root
ENTRYPOINT ["/entrypoint.sh"]
