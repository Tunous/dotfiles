@echo off
title Dotfiles installation script

rem Check admin {{{
  net session >nul 2>&1
  if not %errorlevel% == 0 (
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params=%~1
    echo UAC.ShellExecute "%~s0", "%params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs" >nul
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    exit /B
  )

rem Set variables
  set home=%userprofile%
  set dotfiles=%home%\dotfiles

rem Clone/update repository
  if not exist %dotfiles% (
    git clone http://github.com/Tunous/dotfiles.git "%dotfiles%"
  ) else (
    cd "%dotfiles%"
    git pull
  )

rem Link files
  mklink /d "%home%\vimperator"    "%dotfiles%\vimperator"
  mklink    "%home%\_vimperatorrc" "%dotfiles%\vimperator\vimperatorrc"
  mklink /d "%home%\vimfiles"      "%dotfiles%\vim"

rem Clone vundle repository
  if not exist "%dotfiles%\vim\bundle" (
    mkdir "%dotfiles%\vim\bundle"
  )
  if not exist "%dotfiles%\vim\bundle\vundle" (
    git clone http://github.com/gmarik/vundle.git "%dotfiles%\bundle\vundle"
  )

rem Update vim bundles
  gvim +BundleInstall! +BundleClean +qall

rem vim: foldmethod=indent
