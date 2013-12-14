Align() {
  case $1 in
    left)   printf "^p(_LEFT)"    ;;
    center) printf "^p(_CENTER)"  ;;
    right)  printf "^p(_RIGHT)"   ;;
  esac

  [ -n $2 ] && printf "^p($2)"
}

Color() {
  case $1 in
    red)     printf "#af0000" ;;
    green)   printf "#87af00" ;;
    yellow)  printf "#af8700" ;;
    blue)    printf "#0087af" ;;
    magenta) printf "#6c81c4" ;;
    cyan)    printf "#2aa198" ;;

    *)       printf "#444444" ;;
  esac
}

Icon() {
  printf "^fg($(Color "$2")) ^i(%s) ^fg()" "$HOME/dotfiles/WM/dzen/icons/${1}.xbm"
}

Script() {
  printf "pkill '$1'; $HOME/dotfiles/WM/dzen/$1"
}

Separate() {
  printf "     "
}
