#!/usr/bin/env bash

SUDO="doas"
SUDO=${SUDO:-sudo}

DMENU="rofi -dmenu -p Power Option'"

output=$(echo -en "Poweroff\nReboot\nLogoff" | ${DMENU})

[ "$output" = "Logoff" ] && killall i3
[ "$output" = "Reboot" ] && $SUDO reboot
[ "$output" = "Poweroff" ] && $SUDO poweroff

