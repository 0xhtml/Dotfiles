#!/bin/sh

if [ -z "$1" ]; then
    echo "Usage: $0 <image> <location>"
    exit 1
fi

if [ -z "$2" ]; then
    echo "Usage: $0 $1 <location>"
    exit 1
fi

sudo modprobe nbd max_part=8 && \
sudo qemu-nbd --connect=/dev/nbd0 $1 && \
mkdir -p $2 && \
sudo mount /dev/nbd0p3 $2
