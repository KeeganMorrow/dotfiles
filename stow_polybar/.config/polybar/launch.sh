#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

MONITOR=HDMI-0 polybar example -c $HOME/.config/polybar/config.ini &
MONITOR=DP-4 polybar example -c $HOME/.config/polybar/config.ini &

# Launch bar1 and bar2
# polybar bar1 &
# polybar bar2 &

echo "Bars launched..."
