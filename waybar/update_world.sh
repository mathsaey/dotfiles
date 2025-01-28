#!/usr/bin/bash

footclient --hold \
  powerprofilesctl launch --reason "Updating @world" --profile performance \
  sudo emerge --update --newuse --deep --with-bdeps=y --keep-going @world
