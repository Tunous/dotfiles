# Source bashrc
if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# Add bin and dotfiles/bin in to path
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$HOME/dotfiles/bin:$PATH"
fi

# Panel
export PANEL_FIFO=/tmp/panel-fifo
