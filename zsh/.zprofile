typeset -U path
path+=("$DOTFILES/bin" "$HOME/bin" "$(ruby -e 'print Gem.user_dir')/bin")
