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
    set params = %*:"=""
    echo UAC.ShellExecute "%~s0", "%params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs" >nul
    exit /B
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )

    goto select_links

rem Select what to link ----------------------------------------------------
:select_links
  echo Please select which files to link:
  echo 1. Vim
  echo 2. Vimperator
  echo 3. Both
  echo.

  set /p choose=
  if %choose% gtr 3 ( goto error )
  if %choose% lss 1 ( goto error )

  goto check_path

rem Check if current location contains repository -------------------------
:check_path
  cd %target%

  if %choose% == 1 (
    if exist vim/vimrc (
      goto link_vim
    )
  )
  if %choose% == 2 (
    if exist vimperator/vimperatorrc (
      goto link_vimp
    )
  )
  if %choose% == 3 (
    if exist vim\vimrc (
      if exist vimperator\vimperatorrc (
        goto link_vim
      )
    )
  )

  if %errorLevel% == 1 ( goto error )

  echo Looks like repository is not here.
  goto get_target

rem Get from user location of repository -----------------------------------
:get_target
  set /p target="Please write correct path of repository: "

  if %errorLevel% == 0 (
    cls
    goto check_path
  ) else (
    goto error
  )

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
    set choose=0
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
