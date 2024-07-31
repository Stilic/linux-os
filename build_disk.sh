#!/bin/sh
mkfs.ext4 -F disk
mount disk mnt
cd mnt
mkdir dev proc sys mnt etc sbin bin usr
cp -a ../sources/busybox/_install/* .
cp -ra ../sources/glibc/build/install/* .
cp -ra ../base/* .
cd ..
umount mnt
