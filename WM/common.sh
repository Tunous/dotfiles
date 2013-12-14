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
    # Basic
    [Bb]ackground) printf "#262626" ;;
    [Ff]oreground) printf "#9e9e9e" ;;
    [Cc]omment)    printf "#606060" ;;
    [Ss]election)  printf "#444444" ;;
    [Ll]ine)       printf "#303030" ;;

    [Ww]hite)      printf "#ffffff" ;;
    [Bb]lack)      printf "#000000" ;;

    # Bright
    [Rr]ed)        printf "#af0000" ;;
    [Gg]reen)      printf "#87af00" ;;
    [Yy]ellow)     printf "#af8700" ;;
    [Bb]lue)       printf "#0087af" ;;
    [Mm]agenta)    printf "#6c81c4" ;;
    [Cc]yan)       printf "#2aa198" ;;

    # Dark
    [Dd][Rr]ed)       printf "#a54242" ;;
    [Dd][Gg]reen)     printf "#8c9400" ;;
    [Dd][Yy]ellow)    printf "#d75f00" ;;
    [Dd][Bb]lue)      printf "#5f819d" ;;
    [Dd][Mm]agenta)   printf "#85678f" ;;
    [Dd][Cc]yan)      printf "#5e8d87" ;;

    # Unknown
    *)          printf "#444444" ;;
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
