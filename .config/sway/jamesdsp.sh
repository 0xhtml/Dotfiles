#!/bin/bash

set -eu

PRESET=$(jamesdsp --list-presets | rofi -dmenu -i -no-custom -p jamesdsp)
[[ -n ${PRESET} ]] || exit 1
jamesdsp --load-preset "${PRESET}"
