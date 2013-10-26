@echo off
title Dotfiles installation script

rem Start program ---------------------------------------------------------
:init
  set dotfiles=%~dp0
  set home=%USERPROFILE%\
  goto check_permissions

rem Check administrator permissions ---------------------------------------
:check_permissions
  echo Administrative permissions required. Detecting permissions...
  net session >nul 2>&1

  if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed.
    echo.

    goto link_vimp
  ) else (
    echo Requesting administrative privileges...
    goto UAC_prompt
  )

rem Show admin prompt -----------------------------------------------------
:UAC_prompt
  echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
  set params=%~1
  echo UAC.ShellExecute "%~s0", "%params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

  "%temp%\getadmin.vbs" >nul
  if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
  exit /B

rem Link vimperator files -------------------------------------------------
:link_vimp
  echo Linking vimperator files...
  echo.

  if exist %home%vimperator (
    echo vimperator folder already exists. Skipping to next file.
  ) else (
    mklink /D %home%vimperator %dotfiles%vimperator
  )
  if exist %home%_vimperatorrc (
    echo _vimperatorrc file already exists. Skipping to next file.
  ) else (
    mklink %home%_vimperatorrc %dotfiles%vimperator\vimperatorrc
  )

rem Link vim files --------------------------------------------------------
:link_vim
  echo Linking vim files...
  echo.

  if exist %home%vimfiles (
    echo vimfiles folder already exists. Skipping to next file.
  ) else (
    mklink /D %home%vimfiles %dotfiles%vim
  )

rem Install vim bundles ---------------------------------------------------
:install_bundles
  if not exist %dotfiles%vim\bundle\vundle (
    git clone http://github.com/gmarik/vundle.git "%dotfiles%vim\bundle\vundle"
  )
  gvim +BundleInstall +qall

rem End script ------------------------------------------------------------
:end
  echo.
  echo Setup complete.

rem vim: foldmethod=indent
