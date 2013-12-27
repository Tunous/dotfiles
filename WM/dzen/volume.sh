#!/bin/bash

stat() {
  if [ "$mut" == "[on]" ]; then
    printf "${vol}%%"
  else
    printf "Muted"
  fi
}

while :; do
  vol=$(amixer get Master | egrep -o "[0-9]+%" | egrep -o "[0-9]*")
  mut=$(amixer get Master | egrep 'Playback.*?\[o' | egrep -o '\[o.+\]')

  echo "$vol" | gdbar -nonl -h 5 -fg '#505050' -bg '#000000' -l " $(stat)  "
  printf "^fg(#505050)^ca(1,amixer set Master 1-) %s ^ca()" " ◂ "
  printf "^fg(#505050)^ca(1,amixer set Master 1+) %s ^ca()" " ▸ "
  echo
  sleep 1
done | dzen2 -x -200 -y 26 -w 175 -h 20 -ta r -e 'button1=exec:amixer -D pulse set Master toggle;button2=exit;button3=exit'
