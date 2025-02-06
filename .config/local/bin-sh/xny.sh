#!/usr/bin/env bash

# The xny_langs.json is a modified copy of: https://github.com/YesSeri/xny-cli/blob/417a25258ee3b8b9a46a05f43f0a355bf94b6815/data.json

BASE_URL="https://learnxinyminutes.com"
XNY_DATA=`jq '.' ./xny_langs.json`

function display_lang_docs() {
    local LANG_CODE=$1
    local LANG_URL=$2

    FULL_URL="$BASE_URL$LANG_URL"

    local BAT_LANG_CODE=`bat --list-languages | grep -i "^$LANG_CODE:" \
        | cut -d':' -f2 | cut -d',' -f1`

    if [ -n "$BAT_LANG_CODE" ]; then
        curl -s $FULL_URL | bat -l $BAT_LANG_CODE -n
    else
        curl -s $FULL_URL | bat -n
    fi
}

function find_lang() {
    local INPUT=$1
    echo $XNY_DATA | jq --arg lang $INPUT -r '.[] | select(.name == $lang) | .source_code_link'
}

# If arg is provided, try to find the language
if [ -n "$1" ]; then
    INPUT=$1
    XNY_LINK=`find_lang $INPUT`
    if [ -n "$XNY_LINK" ]; then
        display_lang_docs $INPUT $XNY_LINK
    else
        echo "xny: no such lang '$INPUT'" >&2
        exit 1
    fi
    exit 0
fi

# If no arg provided, go into interactive mode
XNY_LANG=`echo $XNY_DATA | jq -r '.[].name' | gum filter --prompt="Choose> "`
if [ -n "$XNY_LANG" ]; then
    XNY_LINK=`find_lang $XNY_LANG`
    display_lang_docs $XNY_LANG $XNY_LINK
fi
