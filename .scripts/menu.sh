#!/bin/sh

youtube="Youtube download"
rofi_command="rofi -dmenu -p Menu -set-selected 0"
options="$youtube"

chosen="$(echo -e $options | $rofi_command -dmenu -selected-row 0)"

case $chosen in
  $youtube) ~/.scripts/music-download.sh;;
esac
