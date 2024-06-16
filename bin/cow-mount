#!/bin/sh

set -eu

if [ -z ${1+x} ]; then
    echo "Usage: $0 <image> <mountpoint>"
    exit 1
fi

if [ -z ${2+x} ]; then
    echo "Usage: $0 <image> <mountpoint>"
    exit 1
fi

sudo modprobe nbd
for i in $(seq 0 15); do
    if lsblk -A /dev/nbd$i >/dev/null; then
        cat /proc/$(cat /sys/class/block/nbd$i/pid)/cmdline | grep -q $1 || continue
    else
        sudo qemu-nbd --connect=/dev/nbd$i $1
    fi
    sudo partprobe /dev/nbd$i
    sudo mount /dev/$(lsblk -Jb /dev/nbd$i | jq -r '.blockdevices[0].children | sort_by(.size)[-1].name') $2
    exit 0
done
echo "No free nbd device found"
exit 1
