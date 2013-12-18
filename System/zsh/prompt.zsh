# Possible states
VIInsert="%{$fg[white]%} » %{$reset_color%}"
VINormal="%{$fg_bold[black]%} » %{$reset_color%}"
VIInsertRoot="%{$fg[red]%} » %{$reset_color%}"
VINormalRoot="%{$fg_bold[red]%} » %{$reset_color%}"

# Current state
function zle-line-init zle-keymap-select {
  if [[ "$(whoami)" = "root" ]]; then
    VIMode="${${KEYMAP/(vicmd|opp)/$VINormalRoot}/(main|viins)/$VIInsertRoot}"
  else
    VIMode="${${KEYMAP/(vicmd|opp)/$VINormal}/(main|viins)/$VIInsert}"
  fi

  # Actual prompt
  PROMPT="
$VIMode"

  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-keymap-select

# More motions
source ~/dotfiles/System/zsh/opp/opp.zsh
source ~/dotfiles/System/zsh/opp/opp/*.zsh
