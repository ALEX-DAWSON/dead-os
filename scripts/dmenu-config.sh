#!/usr/bin/env bash

. ~/.cache/wal/colors.sh

txt=$color7
bg=$color0
highlight_bg=$color6
highlight_txt=$color3

alias dmenu='dmenu -nb $bg -nf $txt -sb $highlight_bg -sf $highlight_txt -fn Pangolin' 
