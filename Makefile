DOTFILES        = ${shell pwd}
SYSDIR          = ${DOTFILES}/System
APPSDIR         = ${DOTFILES}/Apps
WMDIR           = ${DOTFILES}/WM
XDG_CONFIG_HOME = ${HOME}/.config

help:
	@echo "Available options:"
	@echo " make install     - Symlink all configs"
	@echo " make update      - Update repository\n"
	@echo " make bspwm       - Symlink bspwm config"
	@echo " make mutt        - Symlink mutt config"
	@echo " make system      - Symlink system config"
	@echo " make vim         - Symlink vim config"
	@echo " make vimperator  - Symlink vimperator config"
	@echo " make vundle      - Clone vundle repo - if doesn't exist"
	@echo " make plugins     - Update vim plugins"

install: update bspwm mutt system vim vimperator vundle plugins

update:
	git pull origin master

bspwm:
	@echo "Bspwm:"
	ln -sfn ${WMDIR}/bspwm                     ${XDG_CONFIG_HOME}/bspwm
	ln -sfn ${WMDIR}/sxhkd                     ${XDG_CONFIG_HOME}/sxhkd
	@echo

mutt:
	@echo "Mutt:"
	ln -sfn ${APPSDIR}/mutt                    ${HOME}/.mutt
	@echo

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

vim:
	@echo "Vim:"
	ln -sfn ${APPSDIR}/vim                     ${HOME}/.vim
	@echo

vimperator:
	@echo "Vimperator:"
	ln -sfn ${APPSDIR}/vimperator              ${HOME}/.vimperator
	ln -sf  ${APPSDIR}/vimperator/vimperatorrc ${HOME}/.vimperatorrc
	@echo

vundle:
	@[ -d ${APPSDIR}/vim/bundle/vundle ] || \
	  git clone https://github.com/gmarik/vundle.git ${APPSDIR}/vim/bundle/vundle

plugins:
	vim -u ${APPSDIR}/vim/vimrc +BundleInstall! +BundleClean +qall

.PHONY: help install uninstall bspwm mutt system vim vimperator vundle plugins
