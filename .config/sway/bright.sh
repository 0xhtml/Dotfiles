#!/bin/sh

set -eu

val=$(brightnessctl -mn1 s 10%$1 | cut -d, -f4)
notify-send -t 600 -h string:x-dunst-stack-tag:bright -h int:value:$val "Brightness: $val"
