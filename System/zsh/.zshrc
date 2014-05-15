autoload -U colors && colors
autoload -U compinit && compinit

# Remove dalay
KEYTIMEOUT=1

# Prompt
. $ZDOTDIR/prompt.zsh

setopt AUTO_CD
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

zstyle ':completion:*' menu select

# Aliases
alias ls="ls --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias startX="startx $DOTFILES/System/X/xinitrc"

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/doc/pkgfile/command-not-found.zsh

# Window title
precmd() {
  print -Pn "\e]2;%100<...<%~%<<\a"
}

cd() {
    builtin cd $@ && ls
}

# {{{ Hitory

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_VERIFY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
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
