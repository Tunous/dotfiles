Exec() {
  read prog

  case $prog in
    URxvt)
      exec urxvt &
      ;;
    Shutdown)
      exec urxvt -name 'URxvtFloating' -geometry '50x2' -e sh -c 'echo "Enter your password to shutdown computer:" && sudo shutdown -h now'
      ;;
    Logout)
      exec urxvt -name 'URxvtFloating' -geometry '50x2' -e sh -c 'echo "Are you sure you want to logout (Y/n)" && read answer && [ $answer = Y ] && (pkill panel; pkill dzen2; bspc quit)'
      ;;
  esac
}

(echo "Menu"
echo "URxvt"
echo "Shutdown"
echo "Logout"
) | dzen2 -m -p -l 5 -tw 1 -w 100 -sa l -h 18 -e 'onstart=uncollapse;leaveslave=collapse,exit;button2=exit;button1=menuprint,exit;button3=exit;button4=scrollup;button5=scrolldown' | Exec
