#!/bin/sh
cp ~/.config/i3/config ./config.old
cp ./config ~/.config/i3/config
sudo cp ./scratchpad /usr/bin/scratchpad
sudo chmod 755 /usr/bin/scratchpad
i3-msg restart
