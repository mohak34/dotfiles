#!/bin/bash

# omarchy:summary=Install personal apps from the AUR.
# omarchy:requires-sudo=true

AUR_INSTALL=(
  zen-browser-bin
  bibata-cursor-theme-bin
  vesktop-bin
  helium-browser-bin
)

if gum confirm "Install AUR packages (${AUR_INSTALL[*]})?"; then
  echo -e "Installing AUR packages...\n"
  if (( ${#AUR_INSTALL[@]} > 0 )); then
    if ! omarchy pkg aur add "${AUR_INSTALL[@]}"; then
      echo -e "\nFailed to install some AUR packages."
      exit 1
    fi
  fi
fi