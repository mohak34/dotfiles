#!/bin/bash

# omarchy:summary=Stow all dotfiles packages into the home directory.

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

if gum confirm "Stow dotfiles packages into the home directory?"; then
  cd "$DOTFILES_DIR" || exit 1

  # Fetch dotfile submodules (e.g. the nvim config repo)
  if [[ -f .gitmodules ]]; then
    if ! git submodule update --init --recursive; then
      echo -e "\nFailed to fetch submodules."
      exit 1
    fi
  fi

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