#!/usr/bin/env bash

function show_notif() {
    local player=$1
    local id=$2

    local output=`playerctl -p $player metadata`

    local title=`echo "$output" | grep -oP '.*xesam:title\s*\K.*'`
    local album=`echo "$output" | grep -oP '.*xesam:album\s*\K.*'`
    local artist=`echo "$output" | grep -oP '.*xesam:artist\s*\K.*'`
    local art_url=`echo "$output" | grep -oP '.*mpris:artUrl\s*\K.*'`

    if [[ -n "$album" ]]; then
        local body="$album\n$artist"
    else
        local body="$artist"
    fi

    notify-send "$title" "$body" -i "$art_url" -h "string:x-canonical-private-synchronous:cur-media-$id"
}

id=0
players=`playerctl -l`
for player in $players; do
    ((id++))
    show_notif $player $id
done
