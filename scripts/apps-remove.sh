#!/bin/bash

# omarchy:summary=Remove web apps and unused packages from the system.
# omarchy:requires-sudo=true

REMOVE=(
  obsidian
  kdenlive
  obs-studio
  moonlight-qt
  pinta
)

if gum confirm "Remove web apps and unused packages?"; then
  # Remove all web application launchers (Discord, WhatsApp, YouTube, ...)
  echo -e "Removing web apps...\n"
  if ! omarchy-webapp-remove-all; then
    echo -e "\nFailed to remove web apps."
    exit 1
  fi
  hyprctl reload

  # Remove packages we don't use
  echo -e "Removing unwanted packages...\n"
  if ! omarchy pkg drop "${REMOVE[@]}"; then
    echo -e "\nFailed to remove some packages."
    exit 1
  fi
fi