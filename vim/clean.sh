#!/bin/sh

# clean.sh
# Mathijs Saey

# This script removes any files generated during the VIM setup from a machine
# This comes in handy when recovering from a failed install

rm -rf ~/.tmp/vim
rm -rf ~/.vim
rm ~/.vimrc

