#!/bin/sh
#
# xinitrc
#

export DOTFILES="$HOME/etc"

# Load X resources
xrdb -load "$DOTFILES/Xresources"
xrdb -merge "$DOTFILES/Xcolors/s3r0modmod"

# Fonts
xset +fp /usr/share/fonts/local
xset fp rehash

# Fix for the java applications
wmname LG3D &

if [ -z $1 ]; then
    # Configure keys
    setxkbmap pl
    setxkbmap -option ctrl:nocaps
    xcape

    sxhkd &
    exec $1
else
    exec gnome-session
fi
