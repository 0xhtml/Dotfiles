#!/bin/bash

set -eu

ACTION=$(rofi -dmenu -i -no-custom -p power << EOF
Shut down
Reboot
Hibernate
EOF
)
[[ -n $ACTION ]] || exit 1

case $ACTION in
    "Shut down")
        systemctl poweroff
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Hibernate")
        systemctl hibernate
        ;;
esac
