#!/bin/sh

set -eu

sink=$(pactl get-default-sink)
value=""
args=""

if [ $1 == "m" ]; then
    if eval $(pactl --format=json list sinks | jq -r 'map(select(.name == "'$sink'"))[0].mute'); then
        pactl set-sink-mute $sink 0
    else
        pactl set-sink-mute $sink 1
        value="muted"
        args=" -h string:hlcolor:#6272A5"
    fi
else
    pactl set-sink-mute $sink 0
    pactl set-sink-volume $sink ${1}5%
fi

ivalue=$(pactl --format=json list sinks | jq -r 'map(select(.name == "'$sink'"))[0].volume | ."\(keys[0])".value_percent')
[[ -n $value ]] || value=$ivalue

notify-send -t 600 -h string:x-dunst-stack-tag:vol -h int:value:$ivalue$args "Volume: $value"
