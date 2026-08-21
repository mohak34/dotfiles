#!/bin/bash

# omarchy:summary=Apply Bibata Ice cursor env to systemd/D-Bus launched apps

# Apps spawned by systemd --user or D-Bus activation (spotify, ...) don't
# inherit XCURSOR_THEME from Hyprland's hl.env. environment.d/10-cursor.conf
# (stowed) covers fresh logins; this imports the vars into the running
# systemd user manager and D-Bus activation environment so new launches get
# them without a re-login. Idempotent, safe to rerun.

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

if [[ ! -e "$HOME/.config/environment.d/10-cursor.conf" ]]; then
  stow -d "$DOTFILES_DIR" environment
fi

systemctl --user import-environment XCURSOR_THEME XCURSOR_SIZE
dbus-update-activation-environment --systemd XCURSOR_THEME XCURSOR_SIZE 2>/dev/null

echo "Cursor env applied: Bibata-Modern-Ice (24px). Restart affected apps to see it."
