# Tunous's dotfiles

### Windows Installation

```sh
# Clone repository
git clone https://github.com/Tunous/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Link files
install.bat arg # See install.bat for available arguments

# Init and update submodules
git submodule update --init

# Install vim bundles
vim +BundleInstall +qall
```

### install.bat
This file is used to symlink the appropriate files in `dotfiles` to your home directory.
Currently only windows version is supported.

Available arguments:
* `all` - Link all files
* `vim` - Link only vim files
* `vimp` - Link only vimperator files
