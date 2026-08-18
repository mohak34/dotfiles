#!/bin/bash

# omarchy:summary=Stow all dotfiles packages into the home directory.

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

if gum confirm "Stow dotfiles packages into the home directory?"; then
  cd "$DOTFILES_DIR" || exit 1

  for package in */; do
    package="${package%/}"
    case "$package" in
      scripts | wallpapers) continue ;;
    esac
    echo -e "Stowing $package...\n"
    if ! stow "$package"; then
      echo -e "\nFailed to stow $package."
      exit 1
    fi
  done
fi