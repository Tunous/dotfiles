#!/bin/zsh
# renumber_desktops.sh
# Written by Ethan Li, <lietk12@gmail.com>
# Summary: Renumbers all existing workspaces to be densely numbered in
# ascending order from 1 to n, where n is the total number of workspaces.

num_desktops=$(bspc query --desktops -monitor focused | wc -l)
desktops=($(bspc query --desktops --monitor focused))
for i in {1..${num_desktops}}; do
    if [[ ${i} != $desktops[${i}] ]]; then
        bspc desktop "^${i}" --rename ${i}
    fi
done
