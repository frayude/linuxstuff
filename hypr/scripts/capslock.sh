#!/bin/bash

STATE_FILE="/tmp/caps_lock_state"

if [ ! -f "$STATE_FILE" ]; then
    echo "0" > "$STATE_FILE"
fi

CURRENT_STATE=$(cat "$STATE_FILE")

if [ "$CURRENT_STATE" == "0" ]; then
    notify-send -t 1200 -h string:x-dunst-stack-tag:caps "Caps Lock: ON"
    echo "1" > "$STATE_FILE"
else
    notify-send -t 1200 -h string:x-dunst-stack-tag:caps "Caps Lock: OFF"
    echo "0" > "$STATE_FILE"
fi

