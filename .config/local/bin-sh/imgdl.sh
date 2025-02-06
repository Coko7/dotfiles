#!/usr/bin/env bash

URL=`gum input --prompt="URL> " --placeholder "Paste URL"`
if [ -z "$URL" ]; then
    exit 1
fi

echo "URL> $URL"

FILENAME=`gum input --prompt="Save to> " --placeholder "example.png"`
if [ -z "$FILENAME" ]; then
    exit 1
fi

echo "Save to> $FILENAME"

if [ -e "$FILENAME" ]; then
    echo "imgdl: error: file already exists: $FILENAME" >&2
    exit 1
fi

gum spin --title="Downloading $FILENAME..." -- wget -O "$FILENAME" "$URL"
