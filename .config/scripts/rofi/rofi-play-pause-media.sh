#!/usr/bin/env bash

function get_meta() {
    local player=$1
    local key=$2
    playerctl -p $player metadata --format "{{$key}}"
}

function get_metadata_summary() {
    local player=$1
    local output=`playerctl -p $player metadata`

    local media_status=`playerctl -p $player status`
    case $media_status in
        Playing) label="";;
        Paused) label="";;
        Stopped) label="";;
        *) ;;
    esac

    local title=`get_meta "$player" "title"`
    local artist=`get_meta "$player" "artist"`

    local res="$label $player: $title"
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
    playerctl -p $players play-pause && bash $SCRIPTS/notify-media.sh
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
    status=`playerctl -p $player_name status`
    if [[ "$status" == "Stopped" ]]; then
        continue
    fi
    metadata=`get_metadata_summary $player_name`
    input="$input$metadata\n"
done

input=${input::-2}

# target=`echo "$players" | rofi -dmenu -p "Play/Pause:"`
pick=`echo -e "$input" | rofi -dmenu -p " 󰐎 Play/Pause " -i -theme-str 'window {width: 800px;}'`

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

playerctl -p $target play-pause && bash $SCRIPTS/notify-media.sh $target
