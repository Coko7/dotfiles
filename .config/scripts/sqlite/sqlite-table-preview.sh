#!/usr/bin/env bash

DATABASE="$1"
TABLE="$2"

COUNT=`sqlite3 $DATABASE "SELECT COUNT(*) FROM $TABLE;"`
echo -e "Total: $COUNT\n "

sqlite3 $DATABASE "SELECT * FROM $TABLE LIMIT 100;"
