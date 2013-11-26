#!/bin/bash
repoName="dotfiles"
repoDir="$HOME/$repoName"

# Functions -------------------------------------------------------------------
# Helper functions {{{

# msg {{{
# --------------------------------------------------
# Print normal message

msg() {
  printf '%b\n' "$1" >&2
}

# }}}
# title {{{
# --------------------------------------------------
# Print title message

title() {
  msg "\n---------------------------------------------------"
  msg "> $1\n"
}

# }}}
# result {{{
# --------------------------------------------------
# Print success or fail message basing on specified value
#
# Arguments:
# $1 - "Expression value" - If is equal to 0 function prints success message
# $2 - "Success message"
# $3 - "Fail message"
# $4 - !                  - If specified stops script on fail message

result() {
  if [ "$1" -eq '0' ]; then
    [ -n "$2" ] &&
      msg "\e[32m$2\e[0m"
  else
    [ -n "$3" ] &&
      msg "\e[31m$3\e[0m"

    [ "$4" = ! ] && exit 1
  fi
}

# }}}
# ProgramExists {{{
# --------------------------------------------------
# Check if program exists in PATH

ProgramExists() {
  ret='0'
  type $1 >/dev/null 2>&1 || ret='1'

  result "$ret" "" "To continue you first need to install $1." !
}

# }}}

# }}}
# Main functions {{{

# UpdateRepo {{{
# --------------------------------------------------
# Update git repository

UpdateRepo() {
  title "Trying to update $1..."

  cd "$2" &&
    git pull origin master

  result "$?" "Successfully updated $1" "Failed to update $1"
}

# }}}
# Clone Repo {{{
# --------------------------------------------------
# Clone git repository
#
# Arguments:
# $1 - "Name of repository"
# $2 - "Git_user/repository"
# $3 - "Target directory of repository"

CloneRepo() {
  if [ ! -e "$3/.git" ]; then
    title "Clonning ${1}..."
    git clone "http://github.com/${2}.git" "$3"
    result "$?" "Successfully cloned $1" "Failed to clone $1"
  else
    UpdateRepo "$1" "$3"
  fi
}

# }}}
# Symlink {{{
# --------------------------------------------------
# Create symlinks

lnif () {
  ln -snf "$1" "$2"
  ret="$?"
}

Symlink() {
  ret='0'

  case $1 in
    bspwm)
      lnif "$repoDir/WM/bspwm/bspwmrc"              "$HOME/.config/bspwm/bspwmrc"
      lnif "$repoDir/WM/bspwm/sxhkdrc"              "$HOME/.config/sxhkd/sxhkdrc"
      lnif "$repoDir/WM/bspwm/rules"                "$HOME/bin/bspwm_rules"
      ;;
    mutt)
      lnif "$repoDir/Apps/mutt"                     "$HOME/.mutt"
      ;;
    system)
      lnif "$repoDir/System/compton.conf"           "$HOME/.config/compton.conf"
      lnif "$repoDir/System/profile"                "$HOME/.profile"
      lnif "$repoDir/System/tmux.conf"              "$HOME/.tmux.conf"
      lnif "$repoDir/System/Gtk/gtkrc-2.0"          "$HOME/.gtkrc-2.0"
      lnif "$repoDir/System/xinitrc"                "$HOME/.xinitrc"
      lnif "$repoDir/System/Xmodmap"                "$HOME/.Xmodmap"
      lnif "$repoDir/System/Xresources"             "$HOME/.Xresources"
      lnif "$repoDir/System/zshrc"                  "$HOME/.zshrc"
      ;;
    vim)
      lnif "$repoDir/Apps/vim"                      "$HOME/.vim"
      ;;
    vimperator)
      lnif "$repoDir/Apps/vimperator"               "$HOME/.vimperator"
      lnif "$repoDir/Apps/vimperator/vimperatorrc"  "$HOME/.vimperatorrc"
      ;;
  esac

  result "$ret" "[Success] $1" "[Fail] $1"
}

# }}}
# SetupPlugins {{{
# --------------------------------------------------
# Install and update vim plugins

SetupPlugins() {
  title "Updating plugins for vim..."
  vim -u "$repoDir/Apps/vim/vimrc" +BundleInstall! +BundleClean +qall

  result "0" "Plugins updated"
}

# }}}

# }}}

# Main ------------------------------------------------------------------------
# This is the body of script {{{

# Check path
ProgramExists "vim"
ProgramExists "git"

# Clone/update dotfiles repository
CloneRepo "$repoName" 'Tunous/dotfiles' "$repoDir"

# Create symlinks
title "Trying to link files..."
Symlink "bspwm"
Symlink "mutt"
Symlink "system"
Symlink "vim"
Symlink "vimperator"

# Clone/update vundle
CloneRepo "vundle" 'gmarik/vundle' "$repoDir/Apps/vim/bundle/vundle"

# Install and update vim plugins
SetupPlugins

cd "$repoDir"

# Print end message
title "Done. Thanks for installing $repoName"

# }}}
