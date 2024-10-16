#!/usr/bin/env bash

function selekthor() {
    stdin=`cat -`
    entries=`echo "$stdin" | envsubst`

    input=$1

    local opts=""
    if [ -n "$input" ]; then
        opts="-f $input"
    fi

    pick=`echo $entries | fzf $opts | head -n 1`
    if [ $? != 0 ]; then
        return 1
    fi

    res=`echo $pick | cut -d':' -f2- | xargs`
    echo $res
}
