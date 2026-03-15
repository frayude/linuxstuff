#!/bin/bash

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
# Format nama file ala macOS: Screen Shot YYYY-MM-DD at HH.MM.SS
FILE="$DIR/Screen Shot $(date +'%Y-%m-%d at %H.%M.%S').png"

if grimblast --freeze copysave area "$FILE"; then
    notify-send "Screen Shot" "Saved to Screenshots folder" \
        -i "$FILE" \
        --action="default,Open" | xargs -I {} loupe "$FILE"
else
    exit 1
fi