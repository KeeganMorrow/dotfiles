#!/bin/sh

echo "Starting bspwm"
bspwm &
bspwmpid=$!

# Block on sxhkd
echo "Starting shxkd"
sxhkd

echo "sxhkd exited, killing remaining..."
kill $bspwmpid
echo "Exiting bspwm wrapper script"
