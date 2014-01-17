DOTFILES        = ${shell pwd}
SYSDIR          = ${DOTFILES}/System
APPSDIR         = ${DOTFILES}/Apps
WMDIR           = ${DOTFILES}/WM
XDIR            = ${SYSDIR}/X
XDG_CONFIG_HOME = ${HOME}/.config
XDG_CACHE_HOME  = ${HOME}/.cache

define cecho
	@tput setaf 12
	@printf ":: "
	@tput setaf 3
	@echo $1
	@tput sgr0
endef

# {{{ Main


.PHONY: install update

install: update System Apps WM

update:
	$(call cecho, "Updating dotfiles repository...")
	git pull origin master
	@mkdir -p ${XDG_CONFIG_HOME}
	@mkdir -p ${XDG_CACHE_HOME}

vim-plugins: update
	$(call cecho, "Updating vim plugins...")
	@[[ -d ${APPSDIR}/vim/bundle/vundle/.git ]] || \
	  git clone https://github.com/gmarik/vundle.git ${APPSDIR}/vim/bundle/vundle
	vim -u ${APPSDIR}/vim/vimrc +BundleInstall! +BundleClean +qall


# }}}
# {{{ System


System: compton.conf Gtk zsh
	@echo

compton.conf:
	$(call cecho, "Compton")
	ln -sf ${SYSDIR}/compton.conf ${XDG_CONFIG_HOME}/compton.conf

Gtk:
	$(call cecho, "Gtk")
	mkdir -p ${XDG_CONFIG_HOME}/gtk-2.0
	ln -sf ${SYSDIR}/Gtk/gtkrc-2.0 ${XDG_CONFIG_HOME}/gtk-2.0/gtkrc-2.0
	ln -sfn ${SYSDIR}/Gtk/gtk-3.0 ${XDG_CONFIG_HOME}/gtk-3.0

zsh:
	$(call cecho, "Zsh")
	ln -sf ${SYSDIR}/zsh/zshenv ${HOME}/.zshenv


# }}}
# {{{ Apps


Apps: dunst ranger vim vimperator
	@echo

dunst:
	$(call cecho, "Dunst")
	ln -sfn ${APPSDIR}/dunst ${XDG_CONFIG_HOME}/dunst

ranger:
	$(call cecho, "Ranger")
	ln -sfn ${APPSDIR}/ranger ${XDG_CONFIG_HOME}/ranger

vim:
	$(call cecho, "Vim")
	mkdir -p ${XDG_CACHE_HOME}/vim/undofiles

vimperator:
	$(call cecho, "Vimperator")
	ln -sfn ${APPSDIR}/vimperator ${HOME}/.vimperator
	ln -sf ${APPSDIR}/vimperator/vimperatorrc ${HOME}/.vimperatorrc


# }}}
# {{{ WM


WM: bspwm sxhkd
	@echo

bspwm:
	$(call cecho, "Bspwm")
	ln -sfn ${WMDIR}/bspwm ${XDG_CONFIG_HOME}/bspwm

sxhkd:
	$(call cecho, "Sxhkd")
	ln -sfn ${WMDIR}/sxhkd ${XDG_CONFIG_HOME}/sxhkd


# }}}
