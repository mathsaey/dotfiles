#!/bin/sh

# setup.sh
# Mathijs Saey

# This script should symlink the relevant files to $HOME

# Parent dir of the script
DIR=$(dirname $0)

# Symlink zsh and bash rc files
ln -s $DIR/zsh  ~/.zshrc
ln -s $DIR/bash ~/.bashrc
ln -s $DIR/bash ~/.bash_profile

# Vim and git config
vim/setup.sh
git/setup.sh

# Download oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
