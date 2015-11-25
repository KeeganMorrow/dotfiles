#!/bin/sh
source $(dirname $0)/bspwm_env.sh
while :
do
    echo "Running bspwm"
    echo "starting bspwm"
    bspwm &
    bspwmpid=$!
    echo "starting panel"
    python3 ${HOME}/syncsettings/config/bspwm/panel.py | lemonbar -f "${LEMONBAR_FONT}" -g "${LEMONBAR_GEOMETRY}" &
    panelpid=$!
    # Block on sxhkd
    echo "starting shxkd"
    sxhkd
    echo "sxhkd exited, killing remaining..."
    kill $bspwmpid $panelpid
    echo "bspwm session exited"
done
