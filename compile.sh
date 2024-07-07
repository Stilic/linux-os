#!/bin/sh
cores=$(nproc)
cd sources/linux
make -j$cores
cd ../busybox
make -j$cores
make install