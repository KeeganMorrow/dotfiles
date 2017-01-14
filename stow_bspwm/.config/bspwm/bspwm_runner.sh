#!/bin/sh

echo "Starting bspwm"
bspwm &
bspwmpid=$!

echo "Starting panel"
python3 ${HOME}/syncsettings/repos/lemonaconda/example.py | lemonbar -f "${LEMONBAR_FONT}" -f ${LEMONBAR_FONT_SYMS} -g "${LEMONBAR_GEOMETRY} -B ${LEMONBAR_COLOR}" &
panelpid=$!

echo "Setting background"
nitrogen --restore &

# Start network manager at start
echo "Starting network manager applet"
nm-applet &

# Set the cursor to a normal pointer instead of an X
echo "Setting X cursor to be normal pointer"
xsetroot -cursor_name left_ptr

# Set the key repeat rate
echo "Setting X key repeat rate"
xset r rate 250 30

# Block on sxhkd
echo "Starting shxkd"
sxhkd

echo "sxhkd exited, killing remaining..."
kill $bspwmpid $panelpid
echo "Exiting bspwm wrapper script"
