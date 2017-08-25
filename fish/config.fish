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

set -x PATH $PATH "$HOME/bin" "$HOME/.gem/ruby/2.4.0/bin" "/usr/bin/core_perl"

set -x GNUPGHOME "$XDG_DATA_HOME/GnuPG"
set -x LESSHISTFILE "/dev/null"
