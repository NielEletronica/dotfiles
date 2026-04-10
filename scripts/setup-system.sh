#!/bin/bash
set -e

echo "Installing packages..."

sudo pacman -S --needed --noconfirm \
i3-wm i3status i3lock dmenu \
alacritty rofi dunst \
feh picom \
thunar thunar-archive-plugin file-roller \
mpv zathura zathura-pdf-mupdf \
pavucontrol \
networkmanager nm-applet \
bluez blueman \
polkit-gnome \
xdg-user-dirs \
flameshot \
ttf-jetbrains-mono-nerd \
python-pywal \
archlinux-wallpaper

echo "Enabling services..."
sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth