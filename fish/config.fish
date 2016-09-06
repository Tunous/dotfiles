# Git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_color_branch blue

# Status chars
set __fish_git_prompt_char_dirtystate '⚡'

# Use vi mode
fish_vi_key_bindings

# Remove greeting message
set fish_greeting

set -x EDITOR vim

set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_DATA_HOME "$HOME/.local/share"

set -x DOTFILES "$HOME/etc"
set -x PANEL_FIFO "/tmp/panel-fifo"

set -x PATH $PATH "$DOTFILES/bin" "$HOME/bin" "/usr/bin/core_perl"

set -x GNUPGHOME "$XDG_DATA_HOME/GnuPG"
set -x PASSWORD_STORE_DIR "$XDG_DATA_HOME/passwords-store"
set -x LESSHISTFILE "/dev/null"
set -x XAUTHORITY "$XDG_CACHE_HOME/Xauthority"
