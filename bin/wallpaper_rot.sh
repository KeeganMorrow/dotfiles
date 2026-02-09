#!/usr/bin/env bash

sleep_dur=600
LOG=~/wallpaper_debug.txt

while true; do
    echo "$(date) setting wallpaper" >> "$LOG"
    waypaper --random >> "$LOG"
    sleep "$sleep_dur"
done
