#!/bin/bash
set -e

BACKUP_DIR="$HOME/dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

echo "Backing up to $BACKUP_DIR..."

mkdir -p "$BACKUP_DIR"

cp -r ~/.config/i3 "$BACKUP_DIR/" 2>/dev/null || true
cp -r ~/.config/alacritty "$BACKUP_DIR/" 2>/dev/null || true
cp -r ~/.config/dunst "$BACKUP_DIR/" 2>/dev/null || true
cp -r ~/.cache/wal "$BACKUP_DIR/wal-cache" 2>/dev/null || true

echo "Backup complete!"