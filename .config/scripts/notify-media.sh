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

    local media_status=`playerctl -p $player status`
    case $media_status in
        Playing) STATUS="";;
        Paused) STATUS="";;
        Stopped) STATUS="";;
        *) ;;
    esac

    local BODY=""

    if [[ -n "$album" ]]; then
        BODY="$BODY$album\n"
    fi

    BODY="$BODY$artist"

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

    notify-send "$STATUS $title" "$BODY" -i "$img" -t 2000 -h "string:x-canonical-private-synchronous:cur-media-$notif_id"
}

if [ -n "$1" ]; then
    show_notif $1 1
    exit 0
fi

id=0
players=`playerctl -l`
for player in $players; do
    ((id++))
    show_notif $player $id
done
