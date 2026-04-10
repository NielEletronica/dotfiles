#!/bin/bash
set -e

WALL_BG="/usr/share/backgrounds/archlinux/gritty.png"
WALL_MAIN="/usr/share/backgrounds/archlinux/svalbard.jpg"

echo "Applying pywal theme..."
wal -i "$WALL_BG"

echo "Saving wallpaper..."
mkdir -p ~/.config/wallpaper
echo "$WALL_MAIN" > ~/.config/wallpaper/current