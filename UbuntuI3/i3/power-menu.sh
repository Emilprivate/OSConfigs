#!/usr/bin/env bash
options=" Shutdown\n Reboot\n Suspend\n Logout"
chosen="$(echo -e "$options" | rofi -dmenu -i -p 'Power')"
case "$chosen" in
    " Shutdown") systemctl poweroff ;;
    " Reboot")   systemctl reboot ;;
    " Suspend")  systemctl suspend ;;
    " Logout")   i3-msg exit ;;
esac
