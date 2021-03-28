#!/usr/bin/env dash

DMENU="rofi -dmenu -i"
DMENU=${DMENU:-dmenu}

FILE="$(ls /usr/share/doc/arch-wiki/html/en/ | $DMENU)"

[ "$FILE" != "" ] && xdg-open "/usr/share/doc/arch-wiki/html/en/${FILE}"
