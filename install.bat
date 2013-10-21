@echo off
title Dotfiles installation script


rem Start program ---------------------------------------------------------
:init
  set location=%~dp0
  goto check_permissions


rem Check administrator permissions ---------------------------------------
:check_permissions
  echo Administrative permissions required. Detecting permissions...
  net session >nul 2>&1

  if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed.
    echo.
    goto select_links
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


rem Select what to link ---------------------------------------------------
:select_links
  if "%~1"=="" (
    echo Please select what you want to do:
    echo 1. Link vim files
    echo 2. Link vimperator files
    echo 3. Link all files
    echo 4. Create pathrc file
    echo.

    set /p choose=
    echo.
  ) else (
    set choose=%~1
  )

  if "%choose%" == "1" ( goto link_vim )
  if "%choose%" == "2" ( goto link_vimp )
  if "%choose%" == "3" ( goto link_vimp )
  if "%choose%" == "4" ( goto create_pathrc )

  if "%choose%" == "vim" ( goto link_vim )
  if "%choose%" == "vimp" ( goto link_vimp )
  if "%choose%" == "pathrc" ( goto create_pathrc )
  if "%choose%" == "all" (
    set choose=3
    goto link_vimp
  )

  goto error


rem Link vimperator files -------------------------------------------------
:link_vimp
  rem Go to home directory
  cd %USERPROFILE%

  echo Linking vimperator files...
  echo.

  if exist vimperator (
    echo vimperator folder already exists. Skipping to next file.
  ) else (
    mklink /D vimperator %location%vimperator
  )
  if exist _vimperatorrc (
    echo _vimperatorrc file already exists. Skipping to next file.
  ) else (
    mklink _vimperatorrc %location%vimperator\vimperatorrc
  )

  if "%choose%" == "3" (
    echo.
    goto link_vim
  )

  if %errorLevel% == 0 (
    goto success
  ) else (
    goto error
  )


rem Link vim files --------------------------------------------------------
:link_vim
  rem Go to home directory
  cd %USERPROFILE%

  echo Linking vim files...
  echo.

  if exist vimfiles (
    echo vimfiles folder already exists. Skipping to next file.
  ) else (
    mklink /D vimfiles %location%vim
  )

  goto create_pathrc


rem Create pathrc file ----------------------------------------------------
:create_pathrc
  echo.
  echo Creating pathrc file...
  rem Variables

  set file=%location%vim\pathrc.vim

  set vimrc=%location%vim\vimrc
  set vimprc=%location%vimperator\vimperatorrc
  set color=%location%vim\colors\customized.vim
  set bundle=%location%vim\bundle\

  rem Target content

  >%file% echo ^" File containing all path specific options

  >>%file% echo.
  >>%file% echo ^" Vundle paths ------------------------------------------------------------

  >>%file% echo.
  >>%file% echo set rtp+=%bundle%vundle
  >>%file% echo call vundle#rc('%bundle%')

  >>%file% echo.
  >>%file% echo ^" Mappings ----------------------------------------------------------------

  >>%file% echo.
  >>%file% echo ^" Open vimrc mapping
  >>%file% echo nnoremap ^<leader^>vv :split %vimrc%^<CR^>

  >>%file% echo.
  >>%file% echo ^" Open vimperatorrc mapping
  >>%file% echo nnoremap ^<leader^>vp :split %vimprc%^<CR^>

  >>%file% echo.
  >>%file% echo ^" Open customized colorscheme mapping
  >>%file% echo nnoremap ^<leader^>vt :split %color%^<CR^>

  if %errorLevel% == 0 (
    goto success
  ) else (
    goto error
  )


rem End program -----------------------------------------------------------
:error
  echo.
  echo Error: Something went wrong.
  goto end

:success
  echo.
  echo Success: Everything finished.
  goto end

:end
  pause >nul
  cls
  exit /B
