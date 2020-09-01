#!/bin/bash 

link="$(rofi -dmenu -p "Link")"
youtube-dl -f "bestaudio" -o "~/Music/%(title)s.%(ext)s" $link && notify-send "Youtube-dl" "Download finished"
