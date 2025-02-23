#!/usr/bin/env bash

DBS_DIR=./data/
TABLES_FILE=./tables.txt

if [ -n "$1" ]; then
    MAIN_DB="$1"
else
    MAIN_DB=`find $DBS_DIR -type f -iname "*.db" | gum choose --header="New DB:"`
fi

if [ ! -f "$MAIN_DB" ]; then
    echo "No such database: $MAIN_DB. Exiting."
    exit 1
fi

if [ -n "$2" ]; then
    OLD_DB="$2"
else
    OLD_DB=`find $DBS_DIR -type f -iname "*.db" | gum choose --header="Old DB:"`
fi

if [ ! -f "$OLD_DB" ]; then
    echo "No such database: $OLD_DB. Exiting."
    exit 1
fi

echo "About to merge data from $OLD_DB into $MAIN_DB"

TABLE=`cat $TABLES_FILE | fzf --prompt="Merge table data> " --preview="./sqlite-table-preview.sh $OLD_DB {}"`

echo "Merging $TABLE..."

gum spin --title "Merging data for table $TABLE..." -- sleep 1 \
    && sqlite3 $MAIN_DB "ATTACH '$OLD_DB' AS old; INSERT INTO main.$TABLE SELECT * FROM old.$TABLE; DETACH DATABASE old;"
