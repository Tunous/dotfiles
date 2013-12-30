# Possible states
VIInsert="%{$fg[white]%} » %{$reset_color%}"
VINormal="%{$fg_bold[black]%} » %{$reset_color%}"

# Current state
function zle-line-init zle-keymap-select {
  VIMode="${${KEYMAP/(vicmd|opp)/$VINormal}/(main|viins)/$VIInsert}"

  # Actual prompt
  PROMPT="
$VIMode"

  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-keymap-select

# More motions
source $ZDOTDIR/opp/opp.zsh
source $ZDOTDIR/opp/opp/*.zsh
