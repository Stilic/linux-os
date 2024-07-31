#!/bin/sh
cores=$(nproc)
cd sources/linux
make -j$cores
cd ../glibc
mkdir build
cd build
../configure --prefix=$(realpath install) CC="gcc -m32" CFLAGS="-O3"
make -j$cores
make install
cd ../../busybox
make -j$cores
make install
