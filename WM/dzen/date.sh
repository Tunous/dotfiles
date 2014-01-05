#!/bin/bash

cal -m | sed -re "s/(^|[ ])($(date +%_d))($|[ ])/\1^fg(#0087af)\2^fg()\3/" | dzen2 -p 15 -x -147 -y 27 -w 135 -l 7 -sa c -e 'onstart=uncollapse;button1=exit;button3=exit'
