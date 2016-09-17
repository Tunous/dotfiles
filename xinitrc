#!/bin/sh
#
# xinitrc
#

export DOTFILES="$HOME/etc"

# Set bindings
sxhkd &

# Load X resources
xrdb -load "$DOTFILES/Xresources"
xrdb -merge "$DOTFILES/Xcolors/s3r0modmod"

# Fonts
xset +fp /usr/share/fonts/local
xset fp rehash

# Terminal
urxvtd &

# Fix for the java applications
wmname LG3D &

# Configure keys
bash -c "sleep 5; setxkbmap pl && xmodmap $DOTFILES/Xmodmap && xcape" &

if [ -z $1 ]; then
    exec bspwm
else
    exec gnome-session
fi
