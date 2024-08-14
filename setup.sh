#!/bin/sh
function extract_source {
    local loc="$1"
    local name=$(basename $loc)
    curl -o $name $loc
    loc=${name%-*}
    mkdir $loc
    tar -xf $name --strip-components=1 -C $loc
    rm $name
}
truncate -s 1GB disk
mkdir mnt sources
cd sources
# TODO: get versions using args
extract_source https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.6.37.tar.xz
extract_source https://ftp.gnu.org/gnu/glibc/glibc-2.39.tar.xz
extract_source https://busybox.net/downloads/busybox-1.36.1.tar.bz2
