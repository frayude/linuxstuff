#!/bin/bash

# ID unik buat Brightness (beda sama Volume)
ID=2595

# Ambil data brightness dalam satu tarikan
# brightnessctl -m (machine-readable) ngasih format: device,class,curr,max,percent
BRIGHTNESS_INFO=$(brightnessctl -m)
PERCENT=$(echo "$BRIGHTNESS_INFO" | cut -d',' -f4 | tr -d '%')

# Kirim ke Dunst
# -a osd: Biar dapet styling dari rule [osd] di dunstrc
# -i icon: Pake icon matahari biar makin macOS
notify-send -r $ID -a "osd" "Brightness: ${PERCENT}%" \
    -h int:value:"$PERCENT" \
    -h string:x-dunst-stack-tag:osd_bar \
    -i "display-brightness-symbolic" \
    -u low