#!/bin/sh
alias bing="tput bel"
alias src="source ~/.bashrc; source ~/.bash_aliases"

alias gpuusage="watch -n 0.5 nvidia-smi"
alias bsrc="source ~/.bashrc"
alias top="htop"
alias diff="diff --color"

# search for a file who's name matches $1 (uses thesilversearcher)
alias search="ag -ig"
alias searchhere="ag --norecurse -i"


alias g='git'
alias d='docker'
# who manually sets new upstream branches?
alias gitpush='git push || git push --set-upstream origin $(git branch | grep "*" | sed "s/* //g")'
