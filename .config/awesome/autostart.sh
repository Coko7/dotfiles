#!/usr/bin/env bash

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

source $SCRIPTS/set-wallpaper.sh
set-wallpaper

#run "megasync"
##run "xscreensaver -no-splash"
#run "/usr/bin/dropbox"
#run "insync start"
run "picom"
# run "$XDG_CONFIG_HOME/polybar/launch.sh"
#run "/usr/bin/redshift"
##run "mpd"
##run "nm-applet"
