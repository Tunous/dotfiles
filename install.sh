#!/bin/bash
repoName="dotfiles"
repoDir="$HOME/$repoName"

msg() {
  printf '%b\n' "$1" >&2
}

title() {
  msg "\n---------------------------------------------------"
  msg "> $1\n"
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

UpdateRepo() {
  title "Trying to update $1..."

  cd "$2" &&
    git pull origin master

  result "$?" "Successfully updated $1" "Failed to update $1"
}

CloneRepo() {
  if [ ! -e "$2/.git" ]; then
    title "Clonning ${1}..."
    git clone "$3" "$2"
    result "$?" "Successfully cloned $1" "Failed to clone $1"
  else
    UpdateRepo "$1" "$2"
  fi
}

# Check path
ProgramExists "vim"
ProgramExists "git"

# Clone/update dotfiles repository
CloneRepo "$repoName" "$repoDir" 'http://github.com/Tunous/dotfiles.git'
