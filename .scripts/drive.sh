#!/bin/sh

rofi_command="rofi -p Drive"
title="Drive script"

google_drive="Google drive"
dropbox="Dropbox"

options="$google_drive\n$dropbox"
chosen="$(echo -e $options | $rofi_command -dmenu -selected-row 0)"

notify-send -u normal "$title" "Mounting $chosen";
case $chosen in 
  $google_drive) 
    rclone mount Drive:/ ~/Drive/ && notify-send -u low "$title" "$chosen umounted" || notify-send -u critical "$title" "Can't mount $chosen" &;;
  $dropbox) 
    rclone mount Dropbox:/ ~/Drive/ && notify-send notify-send -u low "$title" "$chosen umounted" || notify-send -u critical "$title" "Can't mount $chosen" &;;
esac
