Tunous's dotfiles
===================

Windows Installation
--------------------

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

Available arguments:
* `all` - Do all the stuff
* `vim` - Link vim files
* `vimp` - Link vimperator files
