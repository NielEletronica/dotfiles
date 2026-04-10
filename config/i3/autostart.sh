#!/bin/bash

# Restore pywal colors
wal -R

# Wallpaper
feh --bg-fill "$(cat ~/.config/wallpaper/current)"

# Services
nm-applet &
dunst &
picom &
blueman-applet &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &