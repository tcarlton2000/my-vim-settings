# my-vim-settings

This repo contains everything needed to reproduce my vim IDE on any system

## Setup

1. `brew install neovim`
1. `brew install cmake`
1. `pip2 install --user neovim`
1. `pip3 install --user neovim`
1. `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
1. `ln -s ~/.vim/ ~/.config/nvim/`
1. `ln -s ~/.vim/ ~/.config/.vim/`
1. `cp .vimrc ~/.vimrc`
1. `ln -s ~/.vimrc ~/.config/nvim/init.vim`
1. Open VIM
1. `:PluginInstall`
1. Install YouComplete using `install.py`
1. Quit and re-open VIM
