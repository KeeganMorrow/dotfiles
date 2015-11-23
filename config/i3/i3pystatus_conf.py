#/usr/bin/env python
# -*- coding: utf-8 -*-
from i3pystatus import Status

status = Status(standalone=True, click_events=True)

BACKGROUND_COLOR="#181818"

powerline_hints = {"markup": "pango", "separator": False, "separator_block_width": 0}

def powerlinify(inputstring, color, type=None, bgcolor=BACKGROUND_COLOR):
    prefix=''
    arrow = "<span color='{1}' background='{2}'>{0}</span>"
    suffix = "</span>"
    if type == 'left':
        arrowchar = ''
        prefix += arrow
    elif type == 'right':
        arrowchar = ''
        suffix += arrow
    else:
        arrowchar = ''
    prefix += "<span background='{1}'>"
    prefix = prefix.format(arrowchar, color, bgcolor)
    suffix = suffix.format(arrowchar, color, bgcolor)
    return prefix + inputstring + suffix

status.register("keyboard_locks",
    format=powerlinify("{scroll}",'#181818'),
    scroll_off="<span color='#080808'>S-🔒 </span>",
    scroll_on='S-🔒 ',
    hints = powerline_hints,
)
status.register("keyboard_locks",
    format=powerlinify("{num}",'#181818', bgcolor='#afff00'),
    num_off="<span color='#080808'>N-🔒 </span>",
    num_on='N-🔒 ',
    hints = powerline_hints,
)
status.register("keyboard_locks",
    format=powerlinify("{caps}",'#181818', type='left', bgcolor='#afff00'),
    caps_off="<span color='#080808'> C-🔒 </span>",
    caps_on=' C-🔒 ',
    hints = powerline_hints,
)
# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
    format=powerlinify("%a %-d %b %X ",'#afff00', type='left', bgcolor='#00afff'),
    color='#181818',
    hints = powerline_hints,
)

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio",
    hints = powerline_hints,
    format=powerlinify("♪{volume}{volume_bar} ", '#00afff', 'left', bgcolor='#444444'),
    color_muted='#d0d0d0',
    color_unmuted='#181818',
    bar_type='horizontal',
)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register("cpu_usage",
    format=powerlinify("avg: {usage} ", '#444444'),
    hints = powerline_hints,
)
status.register("cpu_usage_graph",
    format=powerlinify("{cpu_graph} ", '#444444'),
    hints = powerline_hints,
)

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format=powerlinify("{temp:.0f}°C", '#444444', type='left', bgcolor='#262626'),
    hints = powerline_hints,
)

# The battery monitor has many formatting options, see README for details

# This would look like this, when discharging (or charging)
# ↓14.22W 56.15% [77.81%] 2h:41m
# And like this if full:
# =14.22W 100.0% [91.21%]
#
# This would also display a desktop notification (via D-Bus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
# If you don't have a desktop notification demon yet, take a look at dunst:
#   http://www.knopwob.org/dunst/
status.register("battery",
    format=powerlinify(" {status}/{consumption:.2f}W {percentage:.0f}% [{percentage_design:.0f}%] {remaining:%E%hh:%Mm} ", '#262626'),
    alert=True,
    alert_percentage=5,
    hints = powerline_hints,
    status={
        "DIS": "↓",
        "CHR": "↑",
        "FULL": "=",
    },)

# Displays whether a DHCP client is running
status.register("runwatch",
    format_down=powerlinify(" {name} ", '#262626'),
    format_up=powerlinify(" {name} ", '#262626'),
    name="DHCP",
    hints = powerline_hints,
    path="/var/run/dhclient*.pid",)


# TODO: Make this use default gateway
# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
status.register("network",
    interface="eth0",
    hints = powerline_hints,
    format_up=powerlinify(" {v4cidr} ", '#262626'),
    format_down=powerlinify(" {interface}: DOWN ", '#262626'),
)

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk",
    path="/",
    hints = powerline_hints,
    format=powerlinify("{used}/{total}G [{avail}G]", '#262626', 'left'),
)

status.run()
