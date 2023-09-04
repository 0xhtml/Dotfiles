#!/bin/sh
if [[ "$1" == *.RW2 ]]; then
    feh -. -d --draw-tinted --conversion-timeout 2 --start-at "$1"
else
    xdg-open "$1"
fi
