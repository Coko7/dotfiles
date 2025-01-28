#/usr/bin/env bash

pick=`pactl --format=json list sinks | jq -r '.[].description' | rofi -dmenu -p " 󰓃 Default Speaker " -theme-str 'window { width: 1000px; }'`

if [ -n "$pick" ]; then
    sink=`pactl --format=json list sinks | jq --arg desc "$pick" -r '.[] | select(.description == $desc) | .name'`
    pactl set-default-sink $sink
fi
