#!/bin/bash
repoName="dotfiles"
repoDir="$HOME/$repoName"

msg() {
  printf '%b\n' "$1" >&2
}

result() {
  if [ "$1" -eq '0' ]; then
    [ -z "$2" ] ||
      msg "\e[32m$2\e[0m"
  else
    [ -z "$3" ] ||
      msg "\e[31m$3\e[0m"

    [ "$4" = ! ] && exit 1
  fi
}

ProgramExists() {
  ret='0'
  type $1 >/dev/null 2>&1 || ret='1'

  result "$ret" "" "To continue you first need to install $1." !
}

# Check path
ProgramExists "vim"
ProgramExists "git"
