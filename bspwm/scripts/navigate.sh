#!/bin/bash
# navigate.sh

action="$1"
direction="$2"

[[ "$direction" == "left" ]]  && desktop_direction="prev"
[[ "$direction" == "right" ]] && desktop_direction="next"

if [[ "$action" == "--focus" ]]; then
    # Focus window in selected direction
    bspc window $direction --focus

    # If failed focus desktop instead
    if (( $? )); then
        [[ "$desktop_direction" ]] && bspc desktop $desktop_direction --focus
    fi
elif [[ "$action" == "--move" ]]; then
    current_window=$(bspc query -W -w focused)

    # If there is no focused window then we don't have to move anything
    [[ -z $current_window ]] && exit

    # Try to move window to preselection in chosen direction
    bspc window --to-window ${direction}.manual

    # If failed swap window with one in selected direction
    if (( $? )); then
        bspc window --swap $direction

        # If this failed then move window another desktop
        if (( $? )); then
            current_desktop=$(bspc query -D -d focused)
            num_desktops=$(bspc query -D -m focused | wc -l)
            [[ $current_desktop == $num_desktops && "$direction" == "right" ]] && move_last=1 || move_last=0
            [[ $current_desktop == 1 && "$direction" == "left" ]] && move_first=1 || move_first=0

            # If this is the last desktop create new one and move focused
            # window there
            if (( move_last || move_first )) ; then
                echo correct
                ~/.config/bspwm/scripts/add_desktop.sh
                bspc window --to-desktop $desktop_direction --focus
            else
                echo fail
                bspc window --to-desktop $desktop_direction
                ~/.config/bspwm/scripts/remove_desktop.sh
                bspc window --focus $current_window
            fi
            # elif [[ "$direction" == "left" ]]; then
            #     # If this is the first desktop and we are moving left, then
            #     # create new one and move focused window there
            #     if (( is_first )); then
            #         add-desktop.sh
            #         bspc

            # # If it's last (or first) desktop create new and move to it
            # if [[ $is_last == 1 && $desktop_direction == "next"
            #     || $is_first == 1 && $desktop_direction == "prev" ]]; then
            #     add-desktop.sh
            #     bspc window --to-desktop $desktop_direction --focus
            # else
            #     bspc window --to-desktop $desktop_direction
            #     remove-desktop.sh
            # fi
            # bspc window --focus $current_window
        fi
    fi
fi
