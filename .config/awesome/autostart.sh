#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

~/scripts/set-wallpaper.sh
#run "megasync"
##run "xscreensaver -no-splash"
#run "/usr/bin/dropbox"
#run "insync start"
run "picom"
#run "/usr/bin/redshift"
##run "mpd"
##run "nm-applet"

