#!/bin/sh
cp ~/.config/i3/config ./config.old
cp ./config ~/.config/i3/config

chmod 755 ./scratchpad
sudo cp ./scratchpad /usr/local/bin/scratchpad

i3-msg restart
