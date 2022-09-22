#!/bin/sh

sudo umount /dev/nbd0p3
sudo qemu-nbd --disconnect /dev/nbd0
sudo rmmod nbd
