#!/usr/bin/env python
# -*- coding: utf-8 -*-
import time
import subprocess
import re
import datetime
import sys

BACKGROUND_COLOR="#080808"

def powerlinify(inputstring, color, type=None, bgcolor=BACKGROUND_COLOR):
    prefix='%{{F{2}}}%{{B{1}}}'
    arrow = "%{{R}}{0}%{{R}}"
    suffix = "%{{F-}}%{{B-}}"
    if type == 'left':
        arrowchar = ''
        prefix += arrow
    elif type == 'right':
        arrowchar = ''
        suffix = arrow + suffix
    else:
        arrowchar = ''
    prefix = prefix.format(arrowchar, color, bgcolor)
    suffix = suffix.format(arrowchar, color, bgcolor)
    return prefix + inputstring + suffix

class TimeIndicator():
    def run(self):
        return time.strftime("%a, %d %b %Y %H:%M:%S ", time.localtime())

class DesktopInfo():
    def __init__(self):
        pass

    def run(self):
        result = ''
        pattern = re.compile(r':([O,o,F,f])(\d)')
        status_b = subprocess.check_output(['bspc', 'control', '--get-status'])
        status = status_b.decode('utf-8')
        for (letter, num) in re.findall(pattern, status):
            if letter.isupper():
                # The bakground color thing isn't nice...
                result += ' %{{F#FFFFFF}}{0}%{{F{1}}} '.format(num, BACKGROUND_COLOR)
            else:
                result += ' {0} '.format(num)
        result += ''
        return result

timeindicator = TimeIndicator()
desktopinfo = DesktopInfo()
while (True):
    statusline = '%{l}'
    statusline += powerlinify(desktopinfo.run(), '#00afff', 'right')
    statusline += '%{r}'
    statusline += powerlinify(timeindicator.run(), '#afff00', 'left')
    print(statusline)
    sys.stdout.flush()
    time.sleep(0.25)

