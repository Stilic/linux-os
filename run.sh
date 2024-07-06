#!/bin/sh
exec qemu-system-x86_64 -accel kvm -kernel sources/linux-6.6.35/arch/x86_64/boot/bzImage -initrd initramfs.cpio.gz -nographic -append "quiet console=ttyS0"
