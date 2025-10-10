#!/usr/bin/env bash

. ~/.cache/wal/colors.sh

entries="󰌾  Lock\n󰍃  Logout\n󰒲  Sleep\n󰑓  Reboot\n󰐥  Shutdown\n󰜺  Cancel"

selected=$(echo -e $entries|dmenu -nb $color0 -nf $color6 -sb $color3 -sf $color7 -fn Pangolin-10 -l 7 -c | awk '{print tolower($2)}')

case $selected in
  lock)
    sleep 1
    hyprlock
  ;;
  logout)
    hyprctl dispatch exit
  ;;
  sleep)
    exec systemctl suspend
  ;;
  reboot)
    exec systemctl reboot
  ;;
  shutdown)
    exec systemctl poweroff -i
  ;;
  cancel)
    exit
  ;;
esac
