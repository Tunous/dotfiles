autoload -U colors && colors
autoload -U compinit && compinit

# Remove dalay
KEYTIMEOUT=1

# Prompt
. $ZDOTDIR/prompt.zsh

setopt AUTO_CD
setopt CORRECT

# Aliases
alias ls="ls --color=auto --group-directories-first"
alias startX="startx $DOTFILES/System/X/xinitrc"

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Window title
precmd() {
  print -Pn "\e]2;%100<...<%~%<<\a"
}

# {{{ Hitory

setopt append_history
setopt share_history
setopt hist_verify
setopt hist_ignore_all_dups
export HISTFILE="$ZDOTDIR/.zsh-history"
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE

# }}}
# {{{ Vi-mode

bindkey -v

# Allow backspace to delete behind cursor
bindkey "^?" backward-delete-char

# More motions
source $ZDOTDIR/opp/opp.zsh
source $ZDOTDIR/opp/opp/*.zsh

# }}}
