#!/bin/sh
qemu-system-x86_64 -accel kvm -kernel sources/linux-6.6.35/arch/x86_64/boot/bzImage -initrd initramfs.cpio.gz -nographic -append "quiet console=ttyS0" -netdev user,id=net0 -device virtio-net-pci,netdev=net0
