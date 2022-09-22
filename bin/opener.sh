#!/bin/sh
if [[ "$1" == *.RW2 ]]; then
    imv "$1"
else
    xdg-open "$1"
fi
