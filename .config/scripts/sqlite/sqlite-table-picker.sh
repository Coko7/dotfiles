#!/usr/bin/env bash

DBS_DIR=./data/

if [ -n "$1" ]; then
    DATABASE="$1"
else
    DATABASE=`find $DBS_DIR -type f -iname "*.db" | gum choose --header="Select DB:"`
fi 

if [ ! -f "$DATABASE" ]; then
    echo "No such database: $DATABASE. Exiting."
    exit 1
fi

TABLES=`echo ".tables" | sqlite3 $DATABASE | tr -s '[:space:]' '\n' | sort`
SELECTED_TABLES=`echo -e "$TABLES" | fzf -m --preview="./sqlite-table-preview.sh $DATABASE {}"`

echo -e "$SELECTED_TABLES"
