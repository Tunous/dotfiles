DOTFILES = ${shell pwd}
SYSDIR   = ${DOTFILES}/System
APPSDIR  = ${DOTFILES}/Apps
WMDIR    = ${DOTFILES}/WM

help:
	@echo "Available options:"
	@echo
	@echo "Main:"
	@echo "  make install       - Symlink all configs"
	@echo "  make update        - Update repository"
	@echo
	@echo "  make bspwm         - Symlink bspwm config"
	@echo "  make system        - Symlink system config"
	@echo
	@echo "Apps: "
	@echo "  make mutt          - Symlink mutt config"
	@echo "  make ranger        - Symlink ranger config"
	@echo "  make vimperator    - Symlink vimperator config"
	@echo "  make vim           - Install vim:"
	@echo "    make vim-main    - Symlink vim config"
	@echo "    make vim-vundle  - Clone vundle repo"
	@echo "    make vim-plugins - Update vim plugins"


# Main {{{


install: update system bspwm apps

update:
	git pull origin master

system:
	@echo "System:"
	ln -sf  ${SYSDIR}/compton.conf          ${XDG_CONFIG_HOME}/compton.conf
	ln -sf  ${SYSDIR}/profile               ${HOME}/.profile
	ln -sf  ${SYSDIR}/tmux.conf             ${HOME}/.tmux.conf
	ln -sf  ${SYSDIR}/Gtk/gtkrc-2.0         ${HOME}/.gtkrc-2.0
	ln -sf  ${SYSDIR}/xinitrc               ${HOME}/.xinitrc
	ln -sf  ${SYSDIR}/Xmodmap               ${HOME}/.Xmodmap
	ln -sf  ${SYSDIR}/Xresources            ${HOME}/.Xresources
	ln -sf  ${SYSDIR}/zshrc                 ${HOME}/.zshrc
	@echo

bspwm:
	@echo "Bspwm:"
	ln -sfn ${WMDIR}/bspwm                     ${XDG_CONFIG_HOME}/bspwm
	ln -sfn ${WMDIR}/sxhkd                     ${XDG_CONFIG_HOME}/sxhkd
	@echo


# }}}
# Apps {{{


apps: mutt ranger vimperator vim

mutt:
	@echo "Mutt:"
	ln -sfn ${APPSDIR}/mutt                    ${HOME}/.mutt
	@echo

ranger:
	@echo "Ranger:"
	ln -sfn ${APPSDIR}/ranger                  ${XDG_CONFIG_HOME}/ranger
	@echo

vimperator:
	@echo "Vimperator:"
	ln -sfn ${APPSDIR}/vimperator              ${HOME}/.vimperator
	ln -sf  ${APPSDIR}/vimperator/vimperatorrc ${HOME}/.vimperatorrc
	@echo

vim: vim-main vim-vundle vim-plugins

vim-main:
	@echo "Vim:"
	ln -sfn ${APPSDIR}/vim                     ${HOME}/.vim
	@echo

vim-vundle:
	@[ -d ${APPSDIR}/vim/bundle/vundle ] || \
	  git clone https://github.com/gmarik/vundle.git ${APPSDIR}/vim/bundle/vundle

vim-plugins:
	vim -u ${APPSDIR}/vim/vimrc +BundleInstall! +BundleClean +qall


# }}}


.PHONY: help install update apps system \
  bspwm \
  mutt ranger vimperator \
  vim vim-main vim-vundle vim-plugins
