typeset -U path
path+=(~/dotfiles/Scripts)

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
