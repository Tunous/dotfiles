#!/bin/bash

Exec() {
  read prog
  case $prog in
    Term)         exec urxvt & ;;
    Float*Term)   exec urxvt -name 'URxvtFloating' & ;;
    Web)          exec firefox & ;;

    Run)          dmenu-action ;;
    Logout)       bspc quit; pkill panel; pkill dzen2 ;;
    Reboot)       systemctl reboot ;;
    Shutdown)     systemctl poweroff ;;
  esac
}

(echo
echo "  Term"
echo "  Float Term"
echo "  Web"
echo " ------------------------"
echo "  Run"
echo "  Logout"
echo "  Reboot"
echo "  Shutdown"
) | dzen2 -m -p 5 -l 8 -h 15 -tw 1 -w 100 -sa l -e 'onstart=uncollapse;button2=exit;button1=menuprint,exit;button3=exit' | Exec
