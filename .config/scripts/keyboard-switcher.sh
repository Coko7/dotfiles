#!/usr/bin/env bash

current_layout=`setxkbmap -query | grep layout | awk '{print $2}'`

if [ "$current_layout" == "us" ]; then
  next_layout="fr"
  setxkbmap -layout fr
elif [ "$current_layout" == "fr" ]; then
  next_layout="us"
fi

setxkbmap -layout $next_layout
