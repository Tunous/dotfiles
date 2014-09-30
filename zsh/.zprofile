typeset -U path
path+=("$DOTFILES/bin" "$HOME/bin" "$(ruby -e 'print Gem.user_dir')/bin")

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
