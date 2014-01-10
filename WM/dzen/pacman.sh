#!/bin/bash

updates=$(checkupdates)
lines=$(( $(echo "$updates" | wc -l) + 2 ))
(( $lines == 2 )) && updates="No updates"

(
echo Updates:
echo "$updates"
echo -------------------------
echo Middle click to update
) | dzen2 -p 15 -x -360 -y 27 -w 150 -l $lines -sa c -e 'onstart=uncollapse;button1=exit;button2=exec:urxvt -name URxvtFloating,exit;button3=exit'
