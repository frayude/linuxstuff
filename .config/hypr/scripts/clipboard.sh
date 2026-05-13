#!/bin/bash

# Cek kalau rofi lagi jalan, kalau iya bunuh (toggle), kalau nggak lanjut jalanin
if pgrep -x "rofi" > /dev/null; then
    pkill -x "rofi"
    exit 0
fi

# Jalankan clipboard dengan tema khusus agar beda dengan app launcher
cliphist list | rofi -dmenu -theme ~/.config/rofi/clipboard.rasi | cliphist decode | wl-copy