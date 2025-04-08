#!/bin/sh
if [ "$EUID" -ne 0 ]
then
    echo Please run this script as root.
    exit
fi
mkfs.ext4 -F disk
mount disk mnt
cd mnt
mkdir -p dev proc sys mnt etc lib sbin bin tmp usr var/log/init
cp -a ../sources/busybox/_install/* .
cp -ra ../sources/musl/install/* .
cp -ra ../base/* .
ln -s lib usr/lib
ln -s sbin usr/sbin
ln -s bin usr/bin
umount -fl ../mnt
