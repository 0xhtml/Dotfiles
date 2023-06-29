#!/bin/sh
list=$(pactl --format=json list sinks)
cur=$(echo $list | jq -r 'map(.name) | index("'$(pactl get-default-sink)'")')
index=$(echo $list | jq -r '.[].description' | rofi -dmenu -i -no-custom -format i -selected-row $cur)
[[ -n $index ]] || exit 1
pactl set-default-sink $(echo $list | jq -r '.['$index'].name')
