# Possible states
VIInsert="%{$fg[white]%} » %{$reset_color%}"
VINormal="%{$fg_bold[black]%} » %{$reset_color%}"

# Current state
function zle-line-init zle-keymap-select {
  # Actual prompt
  PROMPT="
${${KEYMAP/(vicmd|opp)/$VINormal}/(main|viins)/$VIInsert}"
  RPROMPT="%{$fg[white]%}%~%{$reset_color%}"

  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-keymap-select
