#!/bin/sh
#
# xinitrc
#

# Set wallpaper
hsetroot -tile ~/usr/Dropbox/Images/Minimalistic_light_bulbs.jpg

# Set bindings
sxhkd &

# Configure keys
setxkbmap pl
xmodmap $DOTFILES/Xmodmap
xcape

# Disable beep and turning off monitor
xset b off
xset -dpms

# Default cursor
xsetroot -cursor_name left_ptr
unclutter -idle 2 &

wm() {
    # Load X resources
    xrdb -load $DOTFILES/Xresources
    xrdb -merge $DOTFILES/Xcolors/s3r0modmod

    # Compositing
    compton &

    # Fonts
    xset +fp /usr/share/fonts/local
    xset fp rehash

    # Terminal
    urxvtd &
    # Notifications
    twmnd &
    # Tray
    stalonetray &

    # Fix for the java applications
    wmname LG3D &

    exec $1
}

[[ -z $1 ]] && wm bspwm
wm $1
