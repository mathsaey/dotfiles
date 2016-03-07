#!/bin/sh

# update.sh
# Mathijs Saey

# This script should be used to sync vim plugins and settings

git pull # Make sure scripts are up to date

# Update plugins
vim +PluginClean +PluginInstall +PluginUpdate +qall now

# Update YCM
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
