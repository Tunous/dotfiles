#!/bin/bash

Align() {
  case $1 in
    left)   printf "^p(_LEFT)"    ;;
    center) printf "^p(_CENTER)"  ;;
    right)  printf "^p(_RIGHT)"   ;;
  esac

  [ -n $2 ] && printf "^p($2)"
}

Icon() {
  printf "^fg($2) ^i(%s) ^fg()" "$HOME/dotfiles/WM/dzen/icons/${1}.xbm"
}

Script() {
  printf "pkill '$1'; $HOME/dotfiles/WM/dzen/$1"
  [[ -n $2 ]] && printf " $2"
}
