#!/usr/bin/env bash

GRAY="\e[37m"
RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34m"
RESET="\e[0m"

VPN_STATE_FILE=$XDG_CONFIG_HOME/local/bin-sh/vpn_state.txt

function pretty() {
    local color="$1"
    local message=$2
    echo -e "${color}$message${RESET}"
}

echo ""

wg_interface=`sudo wg show | grep interface | awk '{print $2}'`
if [ -n "$wg_interface" ]; then
    # connected
    pretty $GREEN "󰳌 Active connection: $wg_interface"
    if ! gum confirm "Disconnect from $wg_interface?" --default=false; then
        exit 0
    fi

    gum spin --title "Disconnecting from $wg_interface..." -- sleep 1 \
        && sudo wg-quick down $wg_interface > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        pretty $RED "Failed to disconnect from: $wg_interface"
        exit 1
    fi

    rm $VPN_STATE_FILE
    pretty $BLUE "󰦜 Successfully disconnected from $wg_interface"
    notify-send -u normal "VPN" "Disconnected" \
        -i "$HOME/Pictures/System/unlocked.png" -t 3000 \
        -h string:x-canonical-private-synchronous:vpn-notif --transient
else
    # not connected
    pretty $GRAY "󰦜 Active connection: None"
    if ! gum confirm "Connect to an interface?"; then
        exit 1
    fi

    interface=`sudo find /etc/wireguard/ -iname "*.conf" -printf "%f\n" \
        | cut -d'.' -f1 \
        | gum choose --header "Select interface"`
    if [ -z "$interface" ]; then
        exit 1
    fi

    gum spin --title "Connecting to $interface..." -- sleep 1 \
        && sudo wg-quick up $interface > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        pretty $RED "Failed to connect to: $interface"
        exit 1
    fi

    echo $interface > $VPN_STATE_FILE
    pretty $GREEN "󰳌 Successfully connected to $interface"
    notify-send -u normal "VPN" "Connected to: $interface" \
        -i "$HOME/Pictures/System/locked.png" -t 3000 \
        -h string:x-canonical-private-synchronous:vpn-notif --transient
fi
