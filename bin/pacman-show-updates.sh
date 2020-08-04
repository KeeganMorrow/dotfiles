#!/usr/bin/env bash
{ checkupdates ; yay -Qum ; } | GREP_COLOR="01;32" grep --color=always -P "^.*?\s" | less -r
