#!/usr/bin/env bash

VPN_STATE_FILE=$XDG_CONFIG_HOME/local/bin-sh/vpn_state.txt
if [ -f $VPN_STATE_FILE ]; then
    interface=`cat $VPN_STATE_FILE`
    echo "{\"text\": \"$interface\", \"class\": \"active\" }"
else
    echo '{"text": "None", "class": "inactive" }'
fi
