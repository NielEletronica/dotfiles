#!/usr/bin/env bash

TV="alsa_output.pci-0000_01_00.1.hdmi-stereo"
HEADSET="alsa_output.pci-0000_06_00.6.analog-stereo"

CURRENT=$(pactl get-default-sink)

if [[ "$CURRENT" == "$TV" ]]; then
    TARGET="$HEADSET"
    NAME="Headset"
else
    TARGET="$TV"
    NAME="TV"
fi

if ! pactl set-default-sink "$TARGET"; then
    notify-send "Áudio" "Falha ao trocar a saída"
    exit 1
fi

while read -r INPUT _; do
    pactl move-sink-input "$INPUT" "$TARGET"
done < <(pactl list short sink-inputs)

notify-send "Áudio" "Saída alterada para $NAME"
