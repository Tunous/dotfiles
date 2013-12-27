autoload -U colors && colors

# Remove dalay
KEYTIMEOUT=1

# Prompt/vi-mode
# bindkey -v
. $ZDOTDIR/prompt.zsh

# {{{ Hitory

setopt append_history
setopt share_history
setopt hist_verify
setopt hist_ignore_all_dups
export HISTFILE="$ZDOTDIR/.zsh-history"
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE

# }}}

setopt AUTO_CD
setopt CORRECT

# Aliases
alias ls="ls --color=auto"
alias pacman="sudo pacman"

# Completion
typeset -U fpath
fpath=(~/.zsh/completion $fpath)

autoload -U compinit
compinit

# Window title
precmd() {
  print -Pn "\e]2;%100<...<%~%<<\a"
}
