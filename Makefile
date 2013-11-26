DOTFILES 	= $(shell pwd)
SYSDIR 		= $(DOTFILES)/System
APPSDIR 	= $(DOTFILES)/Apps
WMDIR		= $(DOTFILES)/WM

help:
	@echo "Installation:"
	@echo "	make install    # Install/symlink all configs\n"
	@echo "	make vim        # Symlink vim config"
	@echo "	make vimperator # Symlink vimperator config"
	@echo "	make bspwm      # Symlink bspwm config"
	@echo "	make mutt       # Symlink mutt config"
	@echo "	make system     # Symlink system config"

install: bspwm mutt system vim vimperator

bspwm:
	@echo "Bspwm:"
	ln -sf  $(WMDIR)/bspwm/bspwmrc             ${HOME}/.config/bspwm/bspwmrc
	ln -sf  $(WMDIR)/bspwm/sxhkdrc             ${HOME}/.config/sxhkd/sxhkdrc
	ln -sf  $(WMDIR)/bspwm/rules               ${HOME}/bin/bspwm_rules
	@echo

mutt:
	@echo "Mutt:"
	ln -sfn $(APPSDIR)/mutt                    ${HOME}/.mutt
	@echo

system:
	@echo "System:"
	ln -sf  $(SYSDIR)/compton.conf          ${HOME}/.config/compton.conf
	ln -sf  $(SYSDIR)/profile               ${HOME}/.profile
	ln -sf  $(SYSDIR)/tmux.conf             ${HOME}/.tmux.conf
	ln -sf  $(SYSDIR)/Gtk/gtkrc-2.0         ${HOME}/.gtkrc-2.0
	ln -sf  $(SYSDIR)/xinitrc               ${HOME}/.xinitrc
	ln -sf  $(SYSDIR)/Xmodmap               ${HOME}/.Xmodmap
	ln -sf  $(SYSDIR)/Xresources            ${HOME}/.Xresources
	ln -sf  $(SYSDIR)/zshrc                 ${HOME}/.zshrc
	@echo

vim:
	@echo "Vim:"
	ln -sfn $(APPSDIR)/vim                     ${HOME}/.vim
	@echo

vimperator:
	@echo "Vimperator:"
	ln -sfn $(APPSDIR)/vimperator              ${HOME}/.vimperator
	ln -sf  $(APPSDIR)/vimperator/vimperatorrc ${HOME}/.vimperatorrc
	@echo

.PHONY: help install uninstall bspwm mutt system vim vimperator
