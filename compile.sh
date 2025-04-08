#!/bin/sh
cores=$(nproc)
cd sources/linux
cp ../../config/linux .config
make -j$cores
cd ../musl
./configure CFLAGS="-O3" --prefix=
make -j$cores
make install DESTDIR=$(realpath install)
cd ../busybox
cp ../../config/busybox .config
make -j$cores
make CONFIG_PREFIX=_install-static install
sed -i 's/^CONFIG_STATIC=.*/CONFIG_STATIC=n/' .config
make -j$cores
make install
