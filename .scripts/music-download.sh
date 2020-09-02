#!/bin/bash 

link="$(rofi -dmenu -p "Link")"

# genre="$(ls -d ~/Music/* | rofi -dmenu -p "Genre")"
genre="$(ls -1 -d ~/Music/* | tr '\n' '\0' | xargs -0 -n 1 basename | rofi -dmenu -p "Genre")"
# youtube-dl -f "bestaudio" -o "~/Music/$genre/%(title)s.%(ext)s" $link && notify-send "Youtube-dl" "Download finished" -c "transfer.complete"

if [[ -z "$genre" ]]; then
  notify-send "Music Download" "Genre not valid" -c "transfer.error"
else
  [ -d "~/Music/$genre" ] || mkdir -p ~/Music/$genre
  youtube-dl -f "bestaudio" -o "~/Music/$genre/%(title)s.%(ext)s" $link && notify-send "Music Download" "Download finished" -c "transfer.complete" || notify-send "Music Download" "Download error"
fi
