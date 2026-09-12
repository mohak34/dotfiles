#!/bin/bash

# omarchy:summary=Apply ASUS preset: 80% battery limit, lightbar off, rainbow wave

command -v asusctl >/dev/null 2>&1 || { echo "asusctl not found — skipping ASUS preset."; exit 1; }

echo "Setting battery limit to 80%..."
asusctl battery limit 80

echo "Disabling lightbar..."
asusctl aura power lightbar

echo "Enabling keyboard power (awake + boot)..."
asusctl aura power keyboard --awake --boot

echo "Setting keyboard brightness to med..."
asusctl leds set med

echo "Setting keyboard to rainbow wave (slow)..."
asusctl aura effect rainbow-wave --speed low --direction right

echo "ASUS preset applied: battery 80%, lightbar off, rainbow wave slow / med brightness."
