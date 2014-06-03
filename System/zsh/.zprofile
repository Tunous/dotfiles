typeset -U path
path+=($DOTFILES/Scripts $HOME/bin)

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx $DOTFILES/System/X/xinitrc
