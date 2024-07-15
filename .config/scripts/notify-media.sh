#!/usr/bin/env bash

output=`playerctl metadata`

title=`echo "$output" | grep -oP '.*xesam:title\s*\K.*'`
album=`echo "$output" | grep -oP '.*xesam:album\s*\K.*'`
artist=`echo "$output" | grep -oP '.*xesam:artist\s*\K.*'`
art_url=`echo "$output" | grep -oP '.*mpris:artUrl\s*\K.*'`

if [[ -n "$album" ]]; then
    body="$album\n$artist"
else
    body="$artist"
fi

notify-send -u low "$title" "$body" -i "$art_url"
