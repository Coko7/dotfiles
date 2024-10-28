#!/usr/bin/env bash

function get_metadata_summary() {
    local player=$1
    local output=`playerctl -p $player metadata`

    local title=`echo "$output" | grep -oP '.*xesam:title\s*\K.*'`
    local album=`echo "$output" | grep -oP '.*xesam:album\s*\K.*'`
    local artist=`echo "$output" | grep -oP '.*xesam:artist\s*\K.*'`

    local res="$title"
    if [[ -n "$album" ]]; then
        res="$res, $album"
    fi

    if [[ -n "$artist" ]]; then
        res="$res ($artist)"
    fi

    echo $res
}

players=`playerctl -l`
player_count=`echo "$players" | wc -l`

if [ "$player_count" -eq 0 ]; then
    exit 0
fi

if [ "$player_count" -eq 1 ]; then
    playerctl -p $players play-pause
    exit 0
fi

declare -A player_names
counter=0
for player in $players; do
    player_names["$counter"]="$player"
    ((counter++))
done

input=""
for id in "${!player_names[@]}"; do
    player_name="${player_names[$id]}"
    metadata=`get_metadata_summary $player_name`
    input="$input$metadata\n"
done

input=${input::-2}

# target=`echo "$players" | rofi -dmenu -p "Play/Pause:"`
pick=`echo -e "$input" | wofi --dmenu --prompt "Play/Pause:"`

target=""
for id in "${!player_names[@]}"; do
    player_name="${player_names[$id]}"
    metadata=`get_metadata_summary $player_name`
    if [ "$metadata" = "$pick" ]; then
        target="$player_name"
        break
    fi
done

if [ -z "$target" ]; then
    exit 1
fi

playerctl -p $target play-pause
