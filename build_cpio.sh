#!/bin/sh
rm -rf initramfs
mkdir initramfs
cd initramfs
mkdir dev proc sys etc sbin bin usr
cp -a ../sources/busybox/_install/{bin,sbin,usr} .
cp -r ../base/* .
find . -print | cpio -o --format=newc | gzip -9 > ../initramfs.cpio.gz