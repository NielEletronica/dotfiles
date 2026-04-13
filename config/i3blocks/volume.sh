#!/bin/bash

# Get current sink
SINK=$(pactl get-default-sink)

# List sinks
SINKS=($(pactl list short sinks | awk '{print $2}'))

# Function to switch sink
switch_sink() {
    for i in "${!SINKS[@]}"; do
        if [[ "${SINKS[$i]}" == "$SINK" ]]; then
            NEXT=$(( (i + 1) % ${#SINKS[@]} ))
            pactl set-default-sink "${SINKS[$NEXT]}"
            break
        fi
    done
}

case $BLOCK_BUTTON in
    1) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;   # left click → mute
    2) pavucontrol & ;;                              # middle click → GUI
    3) switch_sink ;;                                # right click → change output
    4) pactl set-sink-volume @DEFAULT_SINK@ +5% ;;   # scroll up → increase
    5) pactl set-sink-volume @DEFAULT_SINK@ -5% ;;   # scroll down → decrease
esac

# Output volume + mute status
VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}')
MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

if [ "$MUTE" = "yes" ]; then
    echo "MUTED ($VOL)"
else
    echo "$VOL"
fi
