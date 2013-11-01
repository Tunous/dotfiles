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
# $2 - "Target directory of repository"
# $3 - "Git uri of repository"

CloneRepo() {
  if [ ! -e "$2/.git" ]; then
    title "Clonning $1..."
    git clone "$3" "$2"
    result "$?" "Successfully cloned $1" "Failed to clone $1"
  else
    UpdateRepo "$1" "$2"
  fi
}

# }}}
# CreateSymlinks {{{
# --------------------------------------------------
# Create symlinks

lnif () {
  [ -e "$1" ] &&
    ln -s "$1" "$2"

  [ "$?" -eq '0' ] || ret='1'
}

CreateSymlinks() {
  title "Trying to link $1 files..."

  ret='0'

  if [ "$1" = "vim" ]; then
    lnif "$repoDir/vim" "$HOME/vimfiles"
  elif [ "$1" = "vimperator" ]; then
    lnif "$repoDir/vimperator" "$HOME/vimperator"
    lnif "$repoDir/vimperator/vimperatorrc" "$HOME/_vimperatorrc"
  fi

  result "$ret" "Successfully symlinked $1 files" "Failed to symlink $1 files"
}

# }}}
# SetupPlugins {{{
# --------------------------------------------------
# Install and update vim plugins

SetupPlugins() {
  title "Updating plugins for vim..."
  vim -u "$HOME/vimfiles/vimrc" +BundleInstall! +BundleClean +qall

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
CloneRepo "$repoName" "$repoDir" 'http://github.com/Tunous/dotfiles.git'

# Create symlinks
CreateSymlinks "vim"
CreateSymlinks "vimperator"

# Clone/update vundle
CloneRepo "vundle" "$repoDir/vim/bundle/vundle" 'http://github.com/gmarik/vundle.git'

# Install and update vim plugins
SetupPlugins

# Print end message
title "Done. Thanks for installing $repoName"

# }}}
