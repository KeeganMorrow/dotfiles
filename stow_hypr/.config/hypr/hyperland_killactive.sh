#!/usr/bin/env bash

# Taken from https://wiki.hyprland.org/Configuring/Uncommon-tips--tricks/
if [ "$(hyprctl activewindow -j | jq -r ".class")" = "Steam" ]; then
    xdotool getactivewindow windowunmap
else
    hyprctl dispatch killactive ""
fi
