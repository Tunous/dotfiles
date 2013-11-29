#!/bin/bash

screen=$(xdpyinfo | grep 'dimensions:' | egrep -o "[0-9]+x[0-9]+ pixels" | egrep -o "[0-9]+x[0-9]+")
scrx=$(echo $screen | egrep -o "[0-9]+x" | egrep -o "[0-9]+")
posx=$(($scrx - 210))

while :; do
  vol=$(amixer get Master | egrep -o "[0-9]+%" | egrep -o "[0-9]*")
  mut=$(amixer get Master | egrep 'Playback.*?\[o' | egrep -o '\[o.+\]')

  echo "$vol" | dzen2-gdbar -nonl -h 5 -fg '#505050' -bg '#000000' -l " ${vol}%  "
  printf "^fg(#505050)^ca(1,amixer set Master 1-) %s ^ca()" " ◂ "
  printf "^fg(#505050)^ca(1,amixer set Master 1+) %s ^ca()" " ▸ "
  echo
done | dzen2 -x $posx -y 26 -w 175 -ta r -e 'button1=exit;button2=exit;button3=exit;leavetitle=exit'
