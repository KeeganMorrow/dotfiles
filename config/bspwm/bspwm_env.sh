#!/bin/sh

# Socket to use for communicating with bspwm, also in dotfiles/zsh/exports.zsh
export BSPWM_SOCKET="/tmp/bspwm-socket.${USER}"

#TODO: Figure out where log should go
export BSPWM_WRAPPER_LOG="/dev/null"

export LEMONBAR_FONT="Source Code Pro for Powerline:size=9px"

# In the format WIDTHxHEIGHT+X+Y
# This gets passed to bspwm's top padding as well
export BAR_HEIGHT=18
export LEMONBAR_GEOMETRY="x${BAR_HEIGHT}++"
