typeset -U path
path+=(~/dotfiles/Scripts ~/.local/bin)

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx $DOTFILES/System/X/xinitrc
