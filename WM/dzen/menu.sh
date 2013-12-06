#!/bin/bash
. $HOME/dotfiles/WM/dzen/common.sh

Exec() {
  read prog
  case $prog in
    Term)         exec urxvt & ;;
    Float*Term)   exec urxvt -name 'URxvtFloating' & ;;
    Web)          exec firefox & ;;

    Run)          dmenu_run -nb "#262626" -nf "#7d7d7d" -sb "#87af00" -sf "#262626" -p "Exec:" -fn "DejaVu Sans" ;;
    # Logout)       ;;
    # Reboot)       ;;
    # Shutdown)     ;;
  esac
}

(echo
echo '   Term'
echo '   Float Term'
echo '   Web'
echo ──────────────────────────
echo '   Run'
echo 'X Logout'
echo 'X Reboot'
echo 'X Shutdown'
) | dzen2 -m -p -l 8 -tw 1 -w 100 -sa l -e 'onstart=uncollapse;button2=exit;button1=menuprint;button3=exit' | Exec
