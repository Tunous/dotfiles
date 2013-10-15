@echo off
title Autolink

goto init

:: ------------------------------------------------------------------------
:init
  set target=%~dp0
  goto check_Permissions

:: ------------------------------------------------------------------------
:check_Permissions
  echo Administrative permissions required. Detecting permissions...

  net session >nul 2>&1
  if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed.
    goto check_Path
  ) else (
    echo Failure: Current permissions inadequate.
    goto end
  )

:check_Path
  cd %target%

  if exist vim\vimrc (
    if exist vimperator\vimperatorrc (
      goto link_Files
    )
  )

  if %errorLevel% == 1 ( goto end )

  echo.
  echo Looks like repository is not here.
  goto get_Target

:: ------------------------------------------------------------------------
:get_Target
  :: Get location of repository
  set /p target="Please write correct path of repository: " %=%

  if %errorLevel% == 0 (
    cls
    goto check_Path
  ) else (
    goto end
  )

:: ------------------------------------------------------------------------
:link_Files
  :: Go to home directory
  cd %USERPROFILE%

  echo.
  echo Linking files from "%target%" to "%USERPROFILE%"
  echo.

  :: Link folders
  if exist vimfiles (
    echo "vimfiles" folder already exists. Skipping to next file.
  ) else (
    mklink /D vimfiles %batchdir%vim
  )
  if exist vimperator (
    echo "vimperator" folder already exists. Skipping to next file.
  ) else (
    mklink /D vimperator %batchdir%vimperator
  )

  :: Link files
  if exist _vimrc (
    echo "_vimrc" already exists. Skipping to next file.
  ) else (
    mklink /D _vimrc %batchdir%vim\vimrc
  )
  if exist _vimperatorrc (
    echo "_vimperatorrc" already exists. Skipping to next file.
  ) else (
    mklink /D _vimperatorrc %batchdir%vimperator\vimperatorrc
  )

  if %errorLevel% == 0 (
    echo.
    echo All files are linked correctly.
    goto end
  )

:: ------------------------------------------------------------------------
:end
  echo.
  pause
  exit
