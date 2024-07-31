#!/bin/sh
rm -rf initramfs
mkdir initramfs
cd initramfs
mkdir dev proc sys etc sbin bin usr
cp -a ../sources/busybox/_install/* .
cp -ra ../sources/glibc/build/install/* .
cp -ra ../base/* .
find . -print | cpio -o --format=newc | gzip -9 > ../initramfs.cpio.gz
