@echo off
title winAutolink

rem Start program ----------------------------------------------------------
:init
  set target=%~dp0
  goto check_permissions

rem Check administrator permissions ----------------------------------------
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

rem Show admin prompt ------------------------------------------------------
:UAC_prompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params=%1
    echo UAC.ShellExecute "%~s0", "%params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs" >nul
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    exit /B

rem Select what to link ----------------------------------------------------
:select_links
  if "%~1"=="" (
    echo Please select which files to link:
    echo 1. Vim
    echo 2. Vimperator
    echo 3. All
    echo.

    set /p choose=
    echo.
  ) else (
    set choose=%~1
  )

  if "%choose%" == "1" ( goto link_vim )
  if "%choose%" == "2" ( goto link_vimp )
  if "%choose%" == "3" ( goto link_vim )

  if "%choose%" == "vim" ( goto link_vim )
  if "%choose%" == "vimp" ( goto link_vimp )
  if "%choose%" == "all" ( 
    set choose=3
    goto link_vim
  )

  goto error

rem Link vim files ---------------------------------------------------------
:link_vim
  rem Go to home directory
  cd %USERPROFILE%

  echo Linking vim files...
  echo.

  if exist vimfiles (
    echo vimfiles folder already exists. Skipping to next file.
  ) else (
    mklink /D vimfiles %target%vim
  )

  if %choose% == 3 (
    echo.
    goto link_vimp
  )

  if %errorLevel% == 0 (
    goto success
  ) else (
    goto error
  )

rem Link vimperator files --------------------------------------------------
:link_vimp
  rem Go to home directory
  cd %USERPROFILE%

  echo Linking vimperator files...
  echo.

  if exist vimperator (
    echo vimperator folder already exists. Skipping to next file.
  ) else (
    mklink /D vimperator %target%vimperator
  )
  if exist _vimperatorrc (
    echo _vimperatorrc file already exists. Skipping to next file.
  ) else (
    mklink _vimperatorrc %target%vimperator\vimperatorrc
  )

  if %errorLevel% == 0 (
    goto success
  ) else (
    goto error
  )

rem End program ------------------------------------------------------------
:error
  echo.
  echo Error: Something went wrong.
  goto end

:success
  echo.
  echo Success: All files liked correctly.
  goto end

:end
  pause >nul
  cls
  exit /B
