#! /bin/bash

cp ~/.bashrc ./bashrc.backup
cp ./bashrc ~/.bashrc

cp ~/.bash_aliases ./bash_aliases.backup
cp ./bash_aliases ~/.bash_aliases

cp ~/.vimrc ./vimrc.backup
cp ./vimrc ~/.vimrc

chmod 755 ./bin/*
