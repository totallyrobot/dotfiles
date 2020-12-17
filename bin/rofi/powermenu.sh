#!/usr/bin/env bash

SUDO="doas"
SUDO=${SUDO:-sudo}

DMENU="rofi -theme oxide -dmenu -p Power Option'"

output=$(echo -en "Poweroff\nReboot\nLogoff" | ${DMENU})


[ "$output" = "Logoff" ] && killall i3
[ "$output" = "Reboot" ] && doas reboot
[ "$output" = "Poweroff" ] && doas poweroff

