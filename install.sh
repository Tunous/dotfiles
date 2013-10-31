#!/bin/bash
repoName="dotfiles"
repoDir="$HOME/$repoName"

# Functions -------------------------------------------------------------------
# Helper functions {{{

# msg {{{

msg() {
  printf '%b\n' "$1" >&2
}

# }}}
# title {{{

title() {
  msg "\n---------------------------------------------------"
  msg "> $1\n"
}

# }}}
# result {{{

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

# }}}
# ProgramExists {{{

ProgramExists() {
  ret='0'
  type $1 >/dev/null 2>&1 || ret='1'

  result "$ret" "" "To continue you first need to install $1." !
}

# }}}

# }}}
# Main functions {{{

# UpdateRepo {{{

UpdateRepo() {
  title "Trying to update $1..."

  cd "$2" &&
    git pull origin master

  result "$?" "Successfully updated $1" "Failed to update $1"
}

# }}}
# Clone Repo {{{

CloneRepo() {
  if [ ! -e "$2/.git" ]; then
    title "Clonning ${1}..."
    git clone "$3" "$2"
    result "$?" "Successfully cloned $1" "Failed to clone $1"
  else
    UpdateRepo "$1" "$2"
  fi
}

# }}}
# CreateSymlinks {{{

CreateSymlinks() {
  title "Trying to link $1 files..."

  if [ "$1" = "vim" ]; then
    [ -e "$repoDir/vim" ] &&
      ln -s "$repoDir/vim" "$HOME/vimfiles"

    ret="$?"

  elif [ "$1" = "vimperator" ]; then
    [ -e "$repoDir/vimperator" ] &&
      ln -s "$repoDir/vimperator" "$HOME/vimperator"

    ret="$?"

    [ -e "$repoDir/vimperator/vimperatorrc" ] &&
      ln -s "$repoDir/vimperator/vimperatorrc" "$HOME/_vimperatorrc"

    [ "$?" = '0' ] || ret='1'
  fi

  result "$ret" "Successfully symlinked $1 files" "Failed to symlink $1 files"
}

# }}}
# SetupPlugins {{{

SetupPlugins() {
  title "Updating plugins for vim..."
  vim -u "$HOME/vimfiles/vimrc" +qall #+BundleInstall! +BundleClean +qall

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
