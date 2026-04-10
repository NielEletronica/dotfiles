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

#mouse
xinput set-prop 10 298 0 1 0
xinput set-prop 10 295 -0.55

#monitor
xrandr \
  --output DVI-I-0 --mode 1600x900 --left-of HDMI-0 \
  --output HDMI-0 --mode 1920x1080
