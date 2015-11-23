#!/bin/sh

options="option1\noption2\noption3"

windows="$(tmux ls)"
choice=$(echo -e "$windows" | rofi -dmenu)
target=$(echo -e "$choice" | sed 's/:.*//')
urxvt-256color --hold -e zsh -c "tmux attach -t ${target}" &

