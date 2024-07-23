#!/usr/bin/env bash
# This script is called in ~/.config/X11/.xinitrc

configs="curry,nomad,geo,geo-cinema"
pick=`echo $configs | tr ',' '\n' | fzf`

case $pick in
  curry)
      export X_MY_LOC="curry"
    ;;
  geo)
      export X_MY_LOC="geo"
    ;;
  geo-cinema)
      export X_MY_LOC="geo-cinema"
    ;;
  nomad)
      export X_MY_LOC="nomad"
    ;;
  *)
    >&2 echo "x-mon-select: unknown option '$pick'"
    exit 1
    ;;
esac

startx
