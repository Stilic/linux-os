#!/bin/sh
function extract_source {
    archive="_$1"
    curl -o "$archive" "$2"
    mkdir "$1"
    tar -xf $archive --strip-components=1 -C "$1"
    rm $archive
}
truncate -s 1GB disk
mkdir mnt sources
cd sources
# extract_source linux https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.6.58.tar.xz
extract_source musl https://git.musl-libc.org/cgit/musl/snapshot/musl-1.2.5.tar.gz
# extract_source busybox https://busybox.net/downloads/busybox-1.36.1.tar.bz2
