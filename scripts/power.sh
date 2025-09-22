#!/bin/bash

entries="󰌾  Lock\n󰍃  Logout\n󰒲  Sleep\n󰑓  Reboot\n󰐥  Shutdown\n󰜺 Cancel"

selected=$(echo -e $entries|wofi --lines 7 -c ~/.config/wofi/config-power | awk '{print tolower($2)}')

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
