#!/usr/bin/env bash

choice=$(printf '🔒  Bloquear tela\n😴  Suspender\n🔄  Reiniciar\n⏻  Desligar\n❌  Cancelar' |
    rofi -dmenu -i -p 'Energia' -theme-str '
        window {
            width: 360px;
            border-radius: 12px;
        }
        listview {
            lines: 5;
            spacing: 6px;
        }
        element {
            padding: 12px;
            border-radius: 8px;
        }
    ')

case "$choice" in
    *"Bloquear tela")
        swaylock --color 000000
        ;;
    *"Suspender")
        swaylock --color 000000 && systemctl suspend
        ;;
    *"Reiniciar")
        confirm=$(printf 'Não\nSim' | rofi -dmenu -p 'Reiniciar o computador?')
        [[ "$confirm" == "Sim" ]] && systemctl reboot
        ;;
    *"Desligar")
        confirm=$(printf 'Não\nSim' | rofi -dmenu -p 'Desligar o computador?')
        [[ "$confirm" == "Sim" ]] && systemctl poweroff
        ;;
esac
