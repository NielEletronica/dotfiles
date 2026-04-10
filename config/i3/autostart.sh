#!/bin/bash

# Restore pywal colors
wal -i /usr/share/backgrounds/archlinux/gritty.png

# Wallpaper
feh --bg-fill /usr/share/backgrounds/archlinux/svalbard.jpg

# Services
nm-applet &
dunst &
picom &
blueman-applet &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
