#!/bin/bash

# omarchy:summary=Install personal apps from the official Arch repositories.
# omarchy:requires-sudo=true

REPO_INSTALL=(
  stow
  qbittorrent
  easyeffects
)

if gum confirm "Install repo packages (${REPO_INSTALL[*]})?"; then
  echo -e "Installing repo packages...\n"
  if (( ${#REPO_INSTALL[@]} > 0 )); then
    if ! omarchy pkg add "${REPO_INSTALL[@]}"; then
      echo -e "\nFailed to install some repo packages."
      exit 1
    fi
  fi
fi