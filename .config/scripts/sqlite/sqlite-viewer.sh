#!/usr/bin/env bash

DBS_DIR=./data/
TABLES_FILE=./tables.txt

if [ -n "$1" ]; then
    DATABASE="$1"
else
    DATABASE=`find $DBS_DIR -type f -iname "*.db" | gum choose --header="Select DB:"`
fi 

if [ ! -f "$DATABASE" ]; then
    echo "No such database: $DATABASE. Exiting."
    exit 1
fi

cat $TABLES_FILE | fzf --prompt="View $DATABASE> " -m --preview="./sqlite-table-preview.sh $DATABASE {}"
