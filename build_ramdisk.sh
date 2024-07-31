#!/bin/sh
rm -rf ramdisk
mkdir ramdisk
cd ramdisk
mkdir dev proc sys mnt sbin bin usr
cp -a ../sources/busybox/_install/* .
cp -a ../ramdisk_init.sh init
find . -print | cpio -o --format=newc | gzip -9 > ../ramdisk.cpio.gz
