#!/bin/sh
cores=$(nproc)
cd sources/linux
cp ../../config/linux .config
make -j$cores
cd ../glibc
mkdir build
cd build
../configure --prefix=$(realpath install) CC="gcc -m32" CFLAGS="-O3"
make -j$cores
make install
cd ../../busybox
cp ../../config/busybox .config
make -j$cores
make CONFIG_PREFIX=_install-static install
sed -i 's/^CONFIG_STATIC=.*/CONFIG_STATIC=n/' .config
make -j$cores
make install
