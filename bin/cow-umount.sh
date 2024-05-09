#!/bin/sh

set -eu

if [ -z ${1+x} ]; then
    echo "Usage: $0 <mountpoint>"
    exit 1
fi

DEV=$(df | grep $(realpath $1) | awk '{print $1}')
sudo umount $1
if lsblk -J ${DEV%p[0-9]*} | jq -e '.blockdevices[0].children|any(.mountpoints!=[null])' >/dev/null; then
    exit 0
fi
sudo qemu-nbd --disconnect ${DEV%p[0-9]*}
if ! lsblk -A | grep -q nbd; then
    sudo rmmod nbd
fi
