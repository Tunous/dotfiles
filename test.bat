@echo off
title Autolink

goto init

rem Start program ----------------------------------------------------------
:init
  set target=%~dp0
  rem TODO: Delete me, I'm temprorary:
    goto select_links
  goto check_Permissions

rem Check administrator permissions ----------------------------------------
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

rem Select what to link ----------------------------------------------------
:select_links
  echo Select what you want to link:
  echo 1. Vim
  echo 2. Vimperator
  echo 3. Both
  echo.

  set /p choose=
  cls
  if %choose% gtr 3 ( goto error )
  if %choose% lss 1 ( goto error )

  goto check_Path

rem Check if current location contains repository -------------------------
:check_Path
  cd %target%

  if %choose% == 1 (
    if exist vim/vimrc (
      goto link_Vim
    )
  )
  if %choose% == 2 (
    if exist vimperator/vimperatorrc (
      goto link_Vimp
    )
  )
  if %choose% == 3 (
    if exist vim\vimrc (
      if exist vimperator\vimperatorrc (
        goto link_Vim
      )
    )
  )

  if %errorLevel% == 1 ( goto error )

  echo Looks like repository is not here.
  goto get_Target

rem Get from user location of repository -----------------------------------
:get_Target
  set /p target="Please write correct path of repository: "

  if %errorLevel% == 0 (
    cls
    goto check_Path
  ) else (
    goto error
  )

rem Link vim files ---------------------------------------------------------
:link_Vim
  rem Go to home directory
  cd %USERPROFILE%

  echo Linking vim files.
  echo.

  if exist vimfiles (
    echo "vimfiles" folder already exists. Skipping to next file.
  ) else (
    mklink /D vimfiles %batchdir%vim
  )
  if exist _vimrc (
    echo "_vimrc" already exists. Skipping to next file.
  ) else (
    mklink _vimrc %batchdir%vim\vimrc
  )

  if %choose% == 3 (
    echo.
    set choose=0
    goto link_Vimp
  )

  if %errorLevel% == 0 (
    goto success
  ) else (
    goto error
  )

rem Link vimperator files --------------------------------------------------
:link_Vimp
  rem Go to home directory
  cd %USERPROFILE%

  echo Linking vimperator files.
  echo.

  if exist vimperator (
    echo "vimperator" folder already exists. Skipping to next file.
  ) else (
    mklink /D vimperator %batchdir%vimperator
  )
  if exist _vimperatorrc (
    echo "_vimperatorrc" already exists. Skipping to next file.
  ) else (
    mklink _vimperatorrc %batchdir%vimperator\vimperatorrc
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
  echo.
  pause
  exit
