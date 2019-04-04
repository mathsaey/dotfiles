#!/bin/bash

# setup.sh
# Mathijs Saey
# Setup script for personal dotfiles

# This script should always be executed in the dotfiles directory
dir=$(dirname $0)

printf "Fetching dependencies...\n"
git submodule init
git submodule update
pip3 install --user -r dotdrop/requirements.txt

printf "Installing dotfiles...\n"
./dotdrop/dotdrop.sh install --cfg $(realpath $dir/config.yaml)

printf "Done!\n"
