#!/usr/bin/env dash

# a dmenu that manges games installed via lutris
DMENU="rofi -theme oxide -dmenu"
DMENU=${DMENU:-dmenu}

gamelist=$(lutris -l 2> /dev/null) 
gamelist_names=$(echo "$gamelist" | awk -F "|" '{print $2}' | sed 's/\ //' | grep -v "^$(date +%Y)-")
response=$(echo "$gamelist_names" | ${DMENU} -p Games)

if [ "$response" != "" ]; then
	gamelist_ids=$(echo "$gamelist" | awk -F "|" '{print $2 "|" $3}')
	lutris lutris:rungame/$(echo "$gamelist_ids" | grep "^ ${response}" | awk -F '|' '{print $2}' | sed 's/\ //' )
fi
