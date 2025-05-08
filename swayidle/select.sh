#!/bin/bash

rm ~/.config/swayidle/config
ln -s ~/.config/swayidle/"$1" ~/.config/swayidle/config
systemctl --user restart swayidle
