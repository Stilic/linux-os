#!/bin/sh
mkdir sources initramfs
cd sources
# TODO: get versions using args
curl -o linux.tar.xz https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.6.37.tar.xz \
     -o busybox.tar.bz2 https://busybox.net/downloads/busybox-1.36.1.tar.bz2
