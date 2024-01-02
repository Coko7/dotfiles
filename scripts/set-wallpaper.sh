#!/bin/sh
#feh --no-fehbg --bg-scale '/home/coco/Pictures/Wallpapers/kame-house.jpg' 
fd . $HOME/Pictures/Wallpapers -t f -e '.jpg' -e '.png' -e '.webp' -0 | shuf -n1 -z | xargs -0 feh --no-fehbg --bg-fill
