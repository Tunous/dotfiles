DOTFILES = ${shell pwd}
SYSDIR   = ${DOTFILES}/System
APPSDIR  = ${DOTFILES}/Apps
WMDIR    = ${DOTFILES}/WM
XDIR     = ${SYSDIR}/X

# Help {{{


.PHONY: help
help:
	@echo "Dotfiles installation"
	@echo
	@echo "Options:"
	@echo
	@echo " install      Symlink all configs"
	@echo " update       Update repository"
	@echo " wm           Symlink window manager configs"
	@echo " system       Symlink system configs"
	@echo " xorg         Symlink xorg configs"
	@echo " apps         Symlink apps configs"
	@echo " mutt         Symlink mutt configs"
	@echo " ranger       Symlink ranger configs"
	@echo " vimperator   Symlink vimperator configs"
	@echo " vim          Install vim:"
	@echo " vim-main     Symlink vim configs"
	@echo " vim-vundle   Clone vundle repo"
	@echo " vim-plugins  Update vim plugins"


# }}}
# Main {{{


.PHONY: install update system xorg wm
install: update system wm apps

update:
	git pull origin master

system: xorg
	@echo "System:"
	ln -sf  ${SYSDIR}/compton.conf ${XDG_CONFIG_HOME}/compton.conf
	ln -sf  ${SYSDIR}/profile ${HOME}/.profile
	ln -sf  ${SYSDIR}/tmux.conf ${HOME}/.tmux.conf
	ln -sf  ${SYSDIR}/Gtk/gtkrc-2.0 ${HOME}/.gtkrc-2.0
	ln -sf  ${SYSDIR}/zsh/zshrc ${HOME}/.zshrc
	@echo

xorg:
	@echo "Xorg:"
	ln -sf  ${XDIR}/xinitrc ${HOME}/.xinitrc
	ln -sf  ${XDIR}/Xmodmap ${HOME}/.Xmodmap
	ln -sf  ${XDIR}/Xresources ${HOME}/.Xresources
	@echo

wm:
	@echo "Window manager:"
	ln -sfn ${WMDIR}/bspwm ${XDG_CONFIG_HOME}/bspwm
	ln -sfn ${WMDIR}/sxhkd ${XDG_CONFIG_HOME}/sxhkd
	@echo


# }}}
# Apps {{{


.PHONY: apps mutt ranger vimperator
apps: mutt ranger vimperator vim

mutt:
	@echo "Mutt:"
	ln -sfn ${APPSDIR}/mutt ${HOME}/.mutt
	@echo

ranger:
	@echo "Ranger:"
	ln -sfn ${APPSDIR}/ranger ${XDG_CONFIG_HOME}/ranger
	@echo

vimperator:
	@echo "Vimperator:"
	ln -sfn ${APPSDIR}/vimperator ${HOME}/.vimperator
	ln -sf  ${APPSDIR}/vimperator/vimperatorrc ${HOME}/.vimperatorrc
	@echo

.PHONY: vim vim-main vim-vundle vim-plugins
vim: vim-main vim-vundle vim-plugins

vim-main:
	@echo "Vim:"
	ln -sfn ${APPSDIR}/vim ${HOME}/.vim
	@echo

vim-vundle:
	@[ -d ${APPSDIR}/vim/bundle/vundle ] || \
	  git clone https://github.com/gmarik/vundle.git ${APPSDIR}/vim/bundle/vundle

vim-plugins:
	vim -u ${APPSDIR}/vim/vimrc +BundleInstall! +BundleClean +qall


# }}}
