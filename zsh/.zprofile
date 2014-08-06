typeset -U path
path+=($DOTFILES/bin $HOME/bin)

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
