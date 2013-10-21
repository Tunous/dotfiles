# Tunous's dotfiles

### Windows Installation

```sh
# Clone repository
git clone https://github.com/Tunous/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Link files
install.bat all

# Init and update submodules
git submodule update --init

# Install vim bundles
vim +BundleInstall +qall
```

### install.bat
This file is used to symlink the appropriate files in `dotfiles` to your home directory.
Currently only windows version is supported.

Available arguments:
* `all` - Do all the stuff
* `vim` - Link vim files and create pathrc file
* `vimp` - Link vimperator files
* 'pathrc' - Create pathrc file

### pathrc.vim
This files contains all settings that are specific to machine.
It's necessary to create it after cloning repository, because without it vim won't be able to work correctly.
