#!/bin/sh

# If this grows beyond more than like one, make a seperate common file
# Socket to use for communicating with bspwm, also in dotfiles/zsh/exports.zsh
export BSPWM_SOCKET="/tmp/bspwm-socket.${USER}"

export LEMONBAR_FONT="Source Code Pro for Powerline:size=9px"
export LEMONBAR_ARGS="-f '${LEMONBAR_FONT}'"
while :
do
    echo "Running bspwm"
    echo "starting bspwm"
    bspwm &
    bspwmpid=$!
    echo "starting panel"
    python3 ${HOME}/syncsettings/config/bspwm/panel.py | lemonbar ${LEMONBAR_ARGS} &
    panelpid=$!
    # Block on sxhkd
    echo "starting shxkd"
    sxhkd
    echo "sxhkd exited, killing remaining..."
    kill $bspwmpid $panelpid
    echo "bspwm session exited"
done
