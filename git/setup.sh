#!/bin/sh

# setup.sh
# Mathijs Saey

# This script should symlink the relevant files to $HOME

# Parent dir of the script
DIR=$(dirname $0)

ln -s $DIR/config ~/.gitconfig
