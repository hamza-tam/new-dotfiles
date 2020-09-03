#!/bin/sh

rofi_command="rofi -dmenu -p Menu -set-selected 0"

youtube="Youtube download"
drive="Mount a distant drive"

options="$youtube\n$drive"

chosen="$(echo -e $options | $rofi_command -dmenu -selected-row 0)"

case $chosen in
  $youtube) ~/.scripts/music-download.sh;;
  $drive) ~/.scripts/drive.sh;;
esac
