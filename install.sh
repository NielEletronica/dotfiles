#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Linking config files..."

mkdir -p ~/.config

ln -sf "$DOTFILES_DIR/config/i3" ~/.config/
ln -sf "$DOTFILES_DIR/config/alacritty" ~/.config/
ln -sf "$DOTFILES_DIR/config/dunst" ~/.config/

echo "Running system setup..."
bash "$DOTFILES_DIR/scripts/setup-system.sh"

echo "Applying theme..."
bash "$DOTFILES_DIR/scripts/apply-theme.sh"

echo "Done!"