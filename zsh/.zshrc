# Enable completion menu
autoload -U compinit && compinit

# Enable coloring
autoload -U colors && colors

# Mass renaming
autoload -Uz zmv

## ALISES {{{

alias rm='rm -I'
alias cp='cp -rvi'
alias mv='mv -i'

alias ls="ls --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias zmv="noglob zmv -W"

## }}}

## FUNCTIONS {{{

# Auto ls
cd() {
  builtin cd "$@" && ls
}

# Window title
precmd() {
  print -Pn "\e]2;%100<...<%~%<<\a"
}

## }}}

## OPTIONS {{{

# Completion
setopt ALWAYS_TO_END
setopt NO_LIST_AMBIGUOUS
zstyle ':completion:*' menu select

# Input/Output
setopt CORRECT
setopt NOCLOBBER

# History
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_VERIFY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
export HISTFILE="$ZDOTDIR/.zsh-history"
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE

## }}}

## VI-MODE {{{

bindkey -v

# History navigation
bindkey '^p' up-history
bindkey '^n' down-history

# Allow backspace and ^h to delete behind cursor
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# Backward histroy search
bindkey '^r' history-incremental-search-backward

# More motions
source $ZDOTDIR/plugins/opp/opp.zsh
source $ZDOTDIR/plugins/opp/opp/*.zsh

## }}}

## PROMPT {{{

# Enable later substitution in prompt
setopt PROMPT_SUBST

# Current git branch
autoload -Uz vcs_info

zstyle ':vcs_info:*' actionformats '[%b|%a]'
zstyle ':vcs_info:*' formats       '[%b]'
zstyle ':vcs_info:*' enable git

vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "${vcs_info_msg_0_}$del"
  fi
}

# Possible states
VIInsert="%{$fg[white]%} » %{$reset_color%}"
VINormal="%{$fg_bold[black]%} » %{$reset_color%}"

function zle-line-init zle-keymap-select {
  # Actual prompt
  PROMPT="
${${KEYMAP/(vicmd|opp)/$VINormal}/(main|viins)/$VIInsert}"
RPROMPT="%{$fg[white]%}%~ $(vcs_info_wrapper)%{$reset_color%}"

  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select
zle -N zle-line-init

## }}}

## MISC {{{

# Remove dalay
KEYTIMEOUT=1

# Syntax highlighting
source $ZSOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## }}}

# vim: fdm=marker:
