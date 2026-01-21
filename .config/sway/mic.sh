#!/bin/sh

set -euo pipefail

src=$(pactl get-default-source)

if eval $(pactl --format=json list sources | jq -r 'map(select(.name == "'$src'"))[0].mute'); then
    pactl set-source-mute $src 0
    value="unmuted"
else
    pactl set-source-mute $src 1
    value="muted"
fi

notify-send -t 600 -h string:x-dunst-stack-tag:mic "Microphone $value"
