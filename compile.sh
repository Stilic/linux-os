#!/bin/sh
cores=$(nproc)
cd sources/linux
cp ../../config/linux .config
make -j$cores
cd ../glibc
mkdir build
cd build
../configure CFLAGS="-O3" --prefix= --without-gd --without-selinux --disable-werror
make -j$cores
make install DESTDIR=$(realpath install)
cd ../../busybox
cp ../../config/busybox .config
make -j$cores
make CONFIG_PREFIX=_install-static install
sed -i 's/^CONFIG_STATIC=.*/CONFIG_STATIC=n/' .config
make -j$cores
make install
