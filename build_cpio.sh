#!/bin/sh
rm -rf initramfs
mkdir initramfs
cd initramfs
mkdir dev dev/pts proc etc sbin bin usr
cp -a ../sources/busybox/_install/* .
rm -f linuxrc
cp -r ../base/* .
find . -depth -print | cpio -o --format=newc | gzip -9 > ../initramfs.cpio.gz