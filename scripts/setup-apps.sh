#!/bin/bash

# omarchy:summary=Personal app setup (removals + additions + dotfiles)

if gum confirm "Run personal app setup (remove unneeded apps, install your apps, stow dotfiles)?"; then
  "$(dirname "$0")/apps-remove.sh"
  "$(dirname "$0")/apps-repo.sh"
  "$(dirname "$0")/apps-aur.sh"
  "$(dirname "$0")/stow-dotfiles.sh"
fi