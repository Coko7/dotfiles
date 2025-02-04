#!/usr/bin/env bash

stdin=`cat -`
entries=`echo -e "$stdin" | envsubst`

input=$1

opts=""
if [ -n "$input" ]; then
    opts="-f $input"
fi

pick=`echo -e "$entries" | fzf $opts | head -n 1`
if [ $? != 0 ]; then
    return 1
fi

res=`echo $pick | cut -d':' -f2- | xargs`
echo $res
