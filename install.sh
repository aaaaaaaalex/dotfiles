#! /bin/bash

cp ~/.bash_profile ./bash_profile.backup
cp ./bash_profile ~/.bash_profile

cp ~/.bash_aliases ./bash_aliases.backup
cp ./bash_aliases ~/.bash_aliases

cp ~/.vimrc ./vimrc.backup
cp ./vimrc ~/.vimrc

chmod 755 ./bin/*
