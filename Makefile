DOTFILES        = ${shell pwd}
SYSDIR          = ${DOTFILES}/System
APPSDIR         = ${DOTFILES}/Apps
WMDIR           = ${DOTFILES}/WM
XDIR            = ${SYSDIR}/X
XDG_CONFIG_HOME = ${HOME}/.config

# {{{ Main


.PHONY: install update

install: update System Apps WM

update:
	git pull origin master


# }}}
# {{{ System


System: compton.conf Gtk tmux.conf X zsh
	@echo

compton.conf:
	@echo ":: Compton"
	ln -sf ${SYSDIR}/compton.conf ${XDG_CONFIG_HOME}/compton.conf

Gtk:
	@echo ":: Gtk"
	ln -sf ${SYSDIR}/Gtk/gtkrc-2.0 ${HOME}/.gtkrc-2.0

tmux.conf:
	@echo ":: Tmux"
	ln -sf ${SYSDIR}/tmux.conf ${HOME}/.tmux.conf

X:
	@echo ":: X"
	@mkdir -p ${XDG_CONFIG_HOME}/X
	ln -sf ${XDIR}/xinitrc ${HOME}/.xinitrc
	ln -sf ${XDIR}/Xmodmap ${XDG_CONFIG_HOME}/X/Xmodmap
	ln -sf ${XDIR}/Xresources ${XDG_CONFIG_HOME}/X/Xresources

zsh:
	@echo ":: Zsh"
	ln -sf  ${SYSDIR}/zsh/zshenv ${HOME}/.zshenv
	ln -sfn ${SYSDIR}/zsh ${XDG_CONFIG_HOME}/zsh


# }}}
# {{{ Apps


Apps: mutt ranger vim vimperator
	@echo

mutt:
	@echo ":: Mutt"
	ln -sfn ${APPSDIR}/mutt ${HOME}/.mutt

ranger:
	@echo ":: Ranger"
	ln -sfn ${APPSDIR}/ranger ${XDG_CONFIG_HOME}/ranger

vim:
	@echo ":: Vim"
	ln -sfn ${APPSDIR}/vim ${HOME}/.vim
	@[[ -d ${APPSDIR}/vim/bundle/vundle/.git ]] || \
	  git clone https://github.com/gmarik/vundle.git ${APPSDIR}/vim/bundle/vundle
	vim -u ${APPSDIR}/vim/vimrc +BundleInstall! +BundleClean +qall

vimperator:
	@echo ":: Vimperator"
	ln -sfn ${APPSDIR}/vimperator ${HOME}/.vimperator
	ln -sf ${APPSDIR}/vimperator/vimperatorrc ${HOME}/.vimperatorrc


# }}}
# {{{ WM


WM: bspwm sxhkd
	@echo

bspwm:
	@echo ":: Bspwm"
	ln -sfn ${WMDIR}/bspwm ${XDG_CONFIG_HOME}/bspwm

sxhkd:
	@echo ":: Sxhkd"
	ln -sfn ${WMDIR}/sxhkd ${XDG_CONFIG_HOME}/sxhkd


# }}}
