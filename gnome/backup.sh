#!/bin/bash
#chmod +x ~/.config/gnome/backup.sh
# run : ~/.config/gnome/backup.sh
BACKUP_DIR="$HOME/.config/gnome"

# pastikan folder backup ada
mkdir -p "$BACKUP_DIR"

echo "Backing up GNOME settings..."

# backup GNOME settings
dconf dump /org/gnome/ > "$BACKUP_DIR/gnome_settings.dconf"

# backup extension settings
dconf dump /org/gnome/shell/extensions/ > "$BACKUP_DIR/gnome_extensions_settings.dconf"

echo "Backup complete."