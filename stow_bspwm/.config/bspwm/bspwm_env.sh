#!/bin/sh

# Socket to use for communicating with bspwm, also in dotfiles/zsh/exports.zsh
export BSPWM_SOCKET="/tmp/bspwm-socket.${USER}"

#TODO: Figure out where log should go
export BSPWM_WRAPPER_LOG="/dev/null"

export LEMONBAR_FONT="Source Code Pro for Powerline:size=10px"
export LEMONBAR_FONT_SYMS="Symbola:size=10px"

# In the format WIDTHxHEIGHT+X+Y
# This gets passed to bspwm's top padding as well
export BAR_HEIGHT=18
export LEMONBAR_GEOMETRY="x${BAR_HEIGHT}++"
export LEMONBAR_COLOR="#181818"
export I3LOCK_COLOR="000000"
