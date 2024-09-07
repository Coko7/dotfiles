#!/usr/bin/env bash

function selekthor() {
    if [ -z "$SELEK_FILE" ]; then
        >&2 echo "selekthor: please set SELEK_FILE"
        return 1
    fi

    input=$1
    entries=`cat $SELEK_FILE | envsubst`

    local opts=""
    if [ -n "$input" ]; then
        opts="-f $input"
    fi

    pick=`echo $entries | fzf $opts | head -n 1`
    if [ $? != 0 ]; then
        return 1
    fi

    res=`echo $pick | cut -d':' -f2- | tr -d '[:blank:]'`
    echo $res
}
