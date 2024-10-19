#!/usr/bin/env bash

# Dont include files in sub dirs
FILES="$(git ls-files ':(glob)*')"

# Colors
ORANGE='\033[0;33m'
BLUE='\033[34m'
GREEN='\033[32m'
NC='\033[0m' # No Color

for file in $FILES; do
    commit_info=$(git log -1 --pretty=format:"%h;%cd;%an" --date=iso -- "$file")

    hash=`echo "$commit_info" | cut -d';' -f1`
    date=`echo "$commit_info" | cut -d';' -f2`
    author=`echo "$commit_info" | cut -d';' -f3`

    echo -e "${ORANGE}$hash ${BLUE}$date ${GREEN}$author${NC} $file"
done
