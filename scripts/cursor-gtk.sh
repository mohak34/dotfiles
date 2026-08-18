#!/bin/bash

# omarchy:summary=Set Bibata Ice cursor theme for GTK apps

# Hyprland + Wayland apps get the cursor from XCURSOR_THEME in hyprland.lua
# (stowed). GTK apps (Chromium, file dialogs, ...) need the gsettings side,
# which is machine-local state — hence a script. Idempotent, safe to rerun.

command -v gsettings >/dev/null 2>&1 || { echo "gsettings not found — skipping GTK cursor."; exit 0; }

gsettings set org.gnome.desktop.interface cursor-theme "Bibata-Modern-Ice"
gsettings set org.gnome.desktop.interface cursor-size 24

echo "GTK cursor set: Bibata-Modern-Ice (24px)"