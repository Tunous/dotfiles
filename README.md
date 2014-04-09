Tunous's dotfiles
=================

Installation
------------

Before starting install [packages](https://github.com/Tunous/dotfiles#packages).

1. Clone repository `git clone https://github.com/Tunous/dotfiles.git ~/dotfiles`
2. Go to cloned repository `cd ~/dotfiles`
3. Use Makefile to symlink confguration files `make`
4. Restart system or logout and login to make sure that environment variables are set correctly.
5. Install vim plugins `cd ~/dotfiles && make vim-plugins`

Software
--------

* Automounting: **[udevil]**
* Applications launcher: **[dmenu2]**
* Bar and info popups: **[bar]** + **[conky]**
* File explorer: **[ranger]**
* Hiding mouse: **[unclutter]**
* Image viewer: **[feh]**
* Notification daemon: **[dunst]**
* Password management: **[pass]**
* Shell: **[zsh]**
* Terminal emulator: **[rxvt-unicode]**
* Text editor: **[vim]**
* Trash management: **[trash-cli]**
* Version control: **[git]**
* Web browser: **[firefox]** + **[vimperator]**
* Window manager: **[bspwm]** + **[sxhkd]** + **[compton]**

Packages
--------

Main:
```sh
pacman -S atool dunst feh firefox git gvim highlight pass \ 
          ranger rxvt-unicode scrot udevil unclutter \
          urxvt-perls w3m xdotool zsh
```

AUR:
```sh
pacaur -S bdf-tewi-git bspwm-git compton-git dmenu2 \
          google-translate-cli-git sxhkd-git tamzen-font-git \
          trash-cli-git xcape-git xdo-git xtitle-git \
          xwinfo-git zsh-syntax-highlighting-git zukitwo-themes
```

Programs:
```sh
pacman -S evince gimp htop libreoffice-writer steam
pacaur -S dropbox dropbox-cli
```

Thanks to
---------

* [**Bill Indelicato**](http://windelicato.com/) for [dotfiles repository](https://github.com/windelicato/dotfiles)
* [**devlinzed**](https://devlinzed.com/) for [dotfiles repository](https://github.com/devlinzed/dotfiles)
* [**Jurica Vukadin**](https://github.com/u-ra) for [dotfiles repository](https://github.com/u-ra/dotfiles)
* [**Lumolk**](https://github.com/lumolk) for [config repository](https://github.com/lumolk/config)

[bar]: https://github.com/LemonBoy/bar
[bspwm]: https://github.com/baskerville/bspwm
[compton]: https://github.com/chjj/compton
[conky]: http://conky.sourceforge.net/
[dmenu2]: https://bitbucket.org/melek/dmenu2
[dunst]: http://knopwob.org/dunst/index.html
[feh]: http://feh.finalrewind.org/
[firefox]: http://mozilla.org/pl/firefox/new/
[git]: http://git-scm.com/
[pass]: http://zx2c4.com/projects/password-store/
[sxhkd]: https://github.com/baskerville/sxhkd
[ranger]: http://ranger.nongnu.org/
[rxvt-unicode]: http://software.schmorp.de/pkg/rxvt-unicode.html
[udevil]: http://ignorantguru.github.io/udevil/
[unclutter]: https://wiki.archlinux.org/index.php/unclutter
[trash-cli]: https://github.com/andreafrancia/trash-cli
[vim]: http://vim.org/
[vimperator]: http://www.vimperator.org/
[zsh]: http://zsh.org/
