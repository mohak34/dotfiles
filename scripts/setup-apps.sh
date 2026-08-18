#!/bin/bash

# omarchy:summary=Personal app setup (removals + additions)

if gum confirm "Run personal app setup (remove unneeded apps, install your apps)?"; then
  "$(dirname "$0")/apps-remove.sh"
  "$(dirname "$0")/apps-repo.sh"
  "$(dirname "$0")/apps-aur.sh"
fi