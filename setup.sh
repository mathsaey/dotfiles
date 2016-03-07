#!/bin/sh

# setup.sh
# Mathijs Saey

# This script is meant to provide a starting point when VIM is used on a machine
# for the first time.
# NOTE: vim will prompt you a few times during the installation process.

# Location of the script
DIR=$(pwd)

# Create directories
mkdir -p ~/.tmp/vim/backup
mkdir -p ~/.tmp/vim/swap
mkdir -p ~/.tmp/vim/undo
mkdir -p ~/.vim/after

# Create necessary symlinks
ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR/lang/ ~/.vim/after/ftplugin

# Setup Vundle if it doesn't exist
if [ ! -d ~/.vim/bundle ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Install plugins and quit vim
vim +PluginInstall +qall now

# Install youcompleteme
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
