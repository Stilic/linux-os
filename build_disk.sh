#!/bin/sh
if [ "$EUID" -ne 0 ]
then
    echo Please run this script as root.
    exit
fi
mkfs.ext4 -F disk
mount disk mnt
cd mnt
mkdir dev proc sys mnt etc lib lib64 sbin bin tmp usr
cp -a ../sources/busybox/_install/* .
cp -ra ../sources/glibc/build/install/{sbin,bin,lib} .
mv lib/ld-linux* lib64
cp -ra ../base/* .
ln -s lib usr/lib
ln -s lib64 usr/lib64
ln -s sbin usr/sbin
ln -s bin usr/bin
umount -fl ../mnt
