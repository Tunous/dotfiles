autoload -U colors && colors

# Remove dalay
KEYTIMEOUT=1

# Vi-mode
bindkey -v
# Allow backspace to delete behind cursor
bindkey "^?" backward-delete-char

# Prompt
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
alias ls="ls --color=auto --group-directories-first"
alias pacman="sudo pacman"
alias startX="startx $DOTFILES/System/X/xinitrc"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Completion
autoload -U compinit
compinit

# Window title
precmd() {
  print -Pn "\e]2;%100<...<%~%<<\a"
}
