#!/usr/bin/bash

level=$(dunstctl get-pause-level)

if [[ $level = 0 ]]
then
  echo "{\"text\": \"󰍥\"}"
else
  echo "{\"text\": \"󱙎\", \"tooltip\": \"Pause level: $level\", \"class\": \"paused\"}"
fi
