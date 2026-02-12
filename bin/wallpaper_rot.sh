#!/usr/bin/env bash

sleep_dur=600
LOG=~/wallpaper_debug.txt

while true; do
    echo "$(date) setting wallpaper" >> "$LOG"
    waypaper --random >> "$LOG"
    if [ -f "$LOG" ] && [ "$(wc -c < "$LOG")" -gt 1048576 ]; then
        mv "$LOG" "${LOG}.1"
    fi
    sleep "$sleep_dur"
done
