#!/bin/sh
cmdline() {
    local value=" $(cat /proc/cmdline) "
    value="${value##* ${1}=}"
    value="${value%% *}"
    [ "${value}" != "" ] && echo "${value}"
}
mount -t devtmpfs none /dev
mount -t proc proc /proc
mount -t sysfs sysfs /sys
mount $(findfs $(cmdline root)) /mnt
umount /dev /proc /sys
exec switch_root /mnt /init
