#!/bin/bash

pacmanlines=$(pacman -Qu | wc -l)
updates=$(pacman -Qu)
lines=$(( $pacmanlines + 2 ))

(
echo Updates
echo $updates
echo
echo Middle click to update
) | dzen2 -p 15 -x -230 -y 26 -w 150 -l $lines -sa c -e 'onstart=uncollapse;button1=exit;button2=exec:urxvt -name URxvtFloating,exit;button3=exit'
