#!/bin/sh

wallp_dir="$HOME/Pictures/Wallpapers"

# Pick random wallpaper if no argument supplied
if [ "$#" -eq 0 ]; then
  # pick=$(fd . $wallp_dir -t f -e '.jpg' -e '.png' -e '.webp' | shuf -n1)
  feh --no-fehbg --randomize --bg-fill $wallp_dir/*
else
  feh --no-fehbg --bg-fill $1
fi

#feh --no-fehbg --bg-scale '/home/coco/Pictures/Wallpapers/kame-house.jpg' 
#fd . $wallp_dir -t f -e '.jpg' -e '.png' -e '.webp' -0 | shuf -n1 -z | xargs -0 feh --no-fehbg --bg-fill
