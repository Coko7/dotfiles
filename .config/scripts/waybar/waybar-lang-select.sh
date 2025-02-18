#!/usr/bin/env bash

CURRENT_LAYOUT=`hyprkeyb.sh get-active-layout`

value=""
case $CURRENT_LAYOUT in
    "English (US)") value="US" ;;
    "French") value="FR" ;;
    "English (Dvorak)") value="DVO" ;;
    *) value="$CURRENT_LAYOUT" ;;
esac

echo "{\"text\": \"$value\", \"tooltip\": \"$CURRENT_LAYOUT\" }"
