#!/bin/sh

# setup.sh
# Mathijs Saey

# This script is meant to provide a starting point when VIM is used on a machine
# for the first time.
# NOTE: vim will prompt you a few times during the installation process.

# Script location
SCRIPT=$(realpath $0)
# Parent dir of the script
DIR=$(dirname $SCRIPT)

# Create directories
mkdir -p ~/.tmp/vim/backup
mkdir -p ~/.tmp/vim/swap
mkdir -p ~/.tmp/vim/undo
mkdir -p ~/.vim/after

# Create necessary symlinks
ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR/lang/ ~/.vim/ftplugin
ln -s $DIR/syntax/ ~/.vim/after/syntax

# Setup vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins and quit vim
vim +PlugInstall +qall now

