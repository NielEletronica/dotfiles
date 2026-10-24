#!/bin/bash

#exec 9>/tmp/wallpaper.lock
#flock -n 9 || exit 0

DIR="$HOME/Imagens/bgs"
INTERVAL=600
OLD=""

while true; do
  mapfile -t imgs < <(find "$DIR" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) | shuf)
  n=${#imgs[@]}
  [ "$n" -eq 0 ] && sleep 30 && continue
  for ((i=0; i<n; i+=2)); do
    a="${imgs[i]}"
    b="${imgs[(i+1)%n]}"
    swaybg -o DVI-I-1 -i "$a" -m fill -o HDMI-A-1 -i "$b" -m fill &
    NEW=$!
    sleep 1
    [ -n "$OLD" ] && kill "$OLD"
    OLD=$NEW
    sleep "$INTERVAL"
  done
done
