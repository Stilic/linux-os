#!/bin/sh
if [ "$EUID" -ne 0 ]
then
    echo Please run this script as root.
    exit
fi
mkfs.ext4 -F disk
mount disk /mnt
mkdir -p /mnt/dev /mnt/proc /mnt/sys /mnt/mnt /mnt/etc /mnt/lib /mnt/sbin /mnt/bin /mnt/tmp /mnt/usr /mnt/var/log/init
cp -a sources/busybox/_install/* /mnt
cp -ra sources/musl/install/* /mnt
cp -ra base/* /mnt
ln -s /lib /mnt/usr/lib
ln -s /sbin /mnt/usr/sbin
ln -s /bin /mnt/usr/bin
umount /mnt
