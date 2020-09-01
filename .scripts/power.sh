#!/bin/bash

## Author: Hamza Tamenaoul
## Mail: hamzatamenaoul@gmail.com

poweroff="Poweroff"
reboot="Reboot"
suspend="Suspend"

options="$poweroff\n$reboot\n$suspend"

rofi_command="rofi -theme ~/.scripts/themes/power.rasi" 

chosen="$(echo -e $options | $rofi_command -dmenu -selected-row 0)"

case $chosen in 
  $poweroff)
    systemctl poweroff
    ;;
  $reboot)
    systemctl reboot
    ;;
  $suspend)
    mpc -q pause
    systemctl suspend
    ;;
esac
