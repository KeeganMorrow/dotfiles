#!/bin/sh

echo "Starting bspwm"
bspwm &
bspwmpid=$!

echo "Starting panel"
python3 ${HOME}/syncsettings/repos/lemonaconda/example.py | lemonbar -f "${LEMONBAR_FONT}" -g "${LEMONBAR_GEOMETRY}" &
panelpid=$!

# Block on sxhkd
echo "Starting shxkd"
sxhkd -f "${SXHKD_FREQ}"

echo "sxhkd exited, killing remaining..."
kill $bspwmpid $panelpid
echo "Exiting bspwm wrapper script"
