#!/bin/sh

alias gpuusage="watch -n 0.5 nvidia-smi"
alias bsrc="source ~/.bashrc"
alias top="htop"
alias cdgo="cd ~/go/src/github.com/aaaaaaaalex && cd"
alias gc="gcloud compute"
alias diff="diff --color"

# search for a file who's name matches $1 (uses thesilversearcher)
alias search="ag -ig"
alias searchhere="ag --norecurse -i"

# git and docker utility
alias gitpush='git push || git push --set-upstream origin $(git branch | grep "*" | sed "s/* //")'
alias dr="docker restart"
alias dl="docker logs"

alias work="cd ~/Documents/work/website-wordpress"
