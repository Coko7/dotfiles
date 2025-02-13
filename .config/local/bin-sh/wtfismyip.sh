#!/usr/bin/env bash

if ! gum confirm "You sure you want to see it NOW???" --default=false; then
    echo "That's right. You never know who might be peeking... 👀"
    exit 1
fi

IP_DATA=`curl -s https://ipv4.myip.wtf/json | jq`
IP=`echo $IP_DATA | jq -r '.YourFuckingIPAddress'`
LOCATION=`echo $IP_DATA | jq -r '.YourFuckingLocation'`
HOST=`echo $IP_DATA | jq -r '.YourFuckingHostname'`

RED="\e[31m"
RESET="\e[0m"

echo -e "Well, don't say I did not warn you. Here you go bud:"
echo -e "${RED}Your fucking IP:${RESET} $IP"
echo -e "${RED}Your fucking Hostname:${RESET} $HOST"
echo -e "${RED}Your fucking Location:${RESET} $LOCATION"
