# Current git branch
setopt prompt_subst
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

zle -N zle-line-init
zle -N zle-keymap-select
