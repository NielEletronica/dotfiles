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

# Get current volume (number only)
get_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | tr -d '%'
}

# Set volume safely (0–100)
set_volume() {
    local new_vol=$1

    if [ "$new_vol" -gt 100 ]; then
        new_vol=100
    elif [ "$new_vol" -lt 0 ]; then
        new_vol=0
    fi

    pactl set-sink-volume @DEFAULT_SINK@ "${new_vol}%"
}

case $BLOCK_BUTTON in
    1) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;   # left click
    2) pavucontrol & ;;                              # middle click
    3) switch_sink ;;                                # right click
    4) set_volume $(($(get_volume) + 5)) ;;           # scroll up
    5) set_volume $(($(get_volume) - 5)) ;;           # scroll down
esac

# Output volume + mute status
VOL=$(get_volume)
MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

if [ "$MUTE" = "yes" ]; then
    echo "MUTED (${VOL}%)"
else
    echo "${VOL}%"
fi
