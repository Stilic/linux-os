#!/bin/sh
if [ "$EUID" -ne 0 ]
then
    echo Please run this script as root.
    exit
fi
mkfs.ext4 -F disk
mount disk mnt
cd mnt
mkdir dev proc sys mnt etc sbin bin tmp usr
cp -a ../sources/busybox/_install/* .
cp -ra ../sources/glibc/build/install/* .
cp -ra ../base/* .
cd ..
umount mnt
