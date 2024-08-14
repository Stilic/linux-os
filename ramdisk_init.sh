#!/bin/sh
mount -t devtmpfs none /dev
mount -t proc proc /proc
mount -t sysfs sysfs /sys
mount $(sed -e 's/^.*root=//' -e 's/ .*$//' /proc/cmdline) /mnt
umount /dev /proc /sys
export LD_LIBRARY_PATH=/mnt/lib:/mnt/usr/lib
exec switch_root /mnt /init
