#!/usr/bin/bash

footclient --hold --no-wait \
  systemd-inhibit --who="portage" --why="Don't sleep while updating" \
  powerprofilesctl launch --reason "Updating @world" --profile performance \
  sudo emerge --update --changed-use --deep --with-bdeps=y --keep-going @world
