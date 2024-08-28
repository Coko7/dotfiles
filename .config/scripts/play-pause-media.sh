#!/usr/bin/env bash

players=`playerctl -l`
player_count=`echo "$players" | wc -l`

if [ "$player_count" -eq 0 ] || [ "$player_count" -eq 1 ]; then
    target=$players
else
    target=`echo "$players" | rofi -dmenu -p "Play/Pause:"`
fi

playerctl -p $target play-pause
