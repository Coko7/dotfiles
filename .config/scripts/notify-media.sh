#!/usr/bin/env bash

function get_meta() {
    local player=$1
    local key=$2
    playerctl -p $player metadata --format "{{$key}}"
}

function show_notif() {
    local player=$1
    local player_prefix=`echo $player | awk -F'.' '{print $1}'`
    local notif_id=$2

    local title=`get_meta "$player" "title"`
    local album=`get_meta "$player" "album"`
    local artist=`get_meta "$player" "artist"`
    local art_url=`get_meta "$player" "mpris:artUrl"`

    if [[ -n "$album" ]]; then
        local body="$album\n$artist"
    else
        local body="$artist"
    fi

    # image has to be downloaded
    if [[ $art_url == http* ]]; then
        temp_file=$(mktemp --suffix=.jpg)
        wget -q -O "$temp_file" "$art_url"
        img=$temp_file
    else
        img=$art_url
    fi

    # use fallback image if none available
    if [ ! -f "$img" ]; then
        img="$HOME/Pictures/System/music.jpg"
    fi

    notify-send "$title" "$body" -i "$img" -t 2000 -h "string:x-canonical-private-synchronous:cur-media-$notif_id"
}

id=0
players=`playerctl -l`
for player in $players; do
    ((id++))
    show_notif $player $id
done
