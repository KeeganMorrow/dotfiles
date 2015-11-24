#!/bin/sh

# If this grows beyond more than like one, make a seperate common file
# Socket to use for communicating with bspwm, also in dotfiles/zsh/exports.zsh
export BSPWM_SOCKET="/tmp/bspwm-socket.${USER}"

while :
do
    echo "Running bspwm"
    echo "starting bspwm"
    bspwm &
    # Block on sxhkd
    echo "starting shxkd"
    sxhkd
    echo "sxhkd exited, killing remaining..."
    killall bspwm sxhkd
    echo "bspwm session exited"
done
