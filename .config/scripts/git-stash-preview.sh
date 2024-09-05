#!/usr/bin/env bash

stash=`echo "$1" | grep -o 'stash@{[0-9]*}'`
git stash show -p --color=always "$stash" | diff-so-fancy
