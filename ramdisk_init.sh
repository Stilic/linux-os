#!/bin/sh
mount -t tmpfs -o size=64k,mode=0755 tmpfs /dev
mount -t proc proc /proc
mount -t sysfs sysfs /sys
mdev -s
mount $(sed -e 's/^.*root=//' -e 's/ .*$//' /proc/cmdline) /mnt
umount /dev /proc /sys
exec switch_root /mnt /init
