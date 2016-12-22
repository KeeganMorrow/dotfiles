#!/bin/bash

options="option1\noption2\noption3"

windows="$(tmux ls)"
if [ ! "$?" -eq "0" ] ; then
    echo "tmux returned non-zero exit code"
    exit 1
fi

# Separate the attached and detached windows so detached are displayed first
attached_windows="$(echo -e "$windows" | awk '/attached/')"
detached_windows="$(echo -e "$windows" | awk '!/attached/')"

choice=$(echo -e "$detached_windows \n$attached_windows" | rofi -dmenu $@)
target=$(echo -e "$choice" | sed 's/:.*//')
if [ ! -z "$target" ] ; then
    urxvt-256color --hold -e zsh -c "tmux attach -t '${target}'" &
else
    echo "No user input selected!"
fi

