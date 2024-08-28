#!/usr/bin/env bash

function show_notif() {
    local player=$1

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

    notify-send -u low "$title" "$body" -i "$art_url"
}

players=`playerctl -l`
for player in $players; do
    show_notif $player
done
