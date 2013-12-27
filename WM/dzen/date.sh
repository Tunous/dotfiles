#!/bin/bash

cal -m | sed -re "s/(^|[ ])($(date +%d))($|[ ])/\1^fg(#000000)^bg(#9e9e9e)\2^fg()^bg()\3/" | dzen2 -p 15 -x -140 -y 15 -w 140 -l 8 -sa c -e 'onstart=uncollapse;button1=exit;button3=exit'
