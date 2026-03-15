#!/bin/bash

# 1. Update volume dulu dan simpan outputnya di variabel
# Ini lebih cepet daripada manggil wpctl berkali-kali
CURRENT_STATE=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
VOLUME=$(echo "$CURRENT_STATE" | grep -oP '\d\.\d+' | awk '{print $1 * 100}')
MUTE=$(echo "$CURRENT_STATE" | grep "MUTED")

ID=2595

if [ -z "$VOLUME" ]; then exit 1; fi

if [ -n "$MUTE" ]; then
    notify-send -r $ID -a "osd" "Muted" -i "audio-volume-muted" -u low
else
    # Kita pake hint "string:x-dunst-stack-tag" biar Dunst tau ini satu kesatuan
    # Kita tambahin "synchronous" hint biar nembaknya lebih cepet
    notify-send -r $ID -a "osd" "Volume: ${VOLUME}%" \
        -h int:value:"$VOLUME" \
        -h string:x-dunst-stack-tag:osd-bar \
        -u low
fi