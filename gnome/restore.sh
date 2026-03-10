#!/bin/bash
#chmod +x ~/.config/gnome/restore.sh
# run : ~/.config/gnome/restore.sh

BACKUP_DIR="$HOME/.config/gnome"

echo "Restoring GNOME settings..."

# restore GNOME main settings
dconf load /org/gnome/ < "$BACKUP_DIR/gnome_settings.dconf"

echo "Restoring GNOME extension settings..."

# restore extension settings
dconf load /org/gnome/shell/extensions/ < "$BACKUP_DIR/gnome_extensions_settings.dconf"

echo "Restore complete."
echo "Logout and login again to apply changes."