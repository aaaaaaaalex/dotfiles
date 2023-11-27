#!/bin/sh
alias bing="tput bel"
#alias src="source ~/.bashrc; source ~/.bash_aliases"

alias gpuusage="watch -n 0.5 nvidia-smi"
alias top="htop"
alias diff="diff --color"

# search for a file who's name matches $1 (uses thesilversearcher)
alias search="ag -ig"
alias searchhere="ag --norecurse -i"
alias d='docker'
alias g='git'
alias k='kubectl'

# who manually sets new upstream branches?
alias gitpush='git push || git push --set-upstream origin $(git branch | grep "*" | sed "s/* //g")'

alias kc="KUBECONFIG=./.local/kubeconfig kubectl"
alias xkc="KUBECONFIG=./.local/kubeconfig xargs kubectl"
alias wkc="KUBECONFIG=./.local/kubeconfig watch -cn.5 kubectl"
alias kccs="KUBECONFIG=./.local/kubeconfig kubectl -n calico-system"
alias kcks="KUBECONFIG=./.local/kubeconfig kubectl -n kube-system"
alias kcto="KUBECONFIG=./.local/kubeconfig kubectl -n tigera-operator"
alias kcal="KUBECONFIG=./.local/kubeconfig kubectl calico"
alias eksh="ssh -i .local/eks/master_ssh_key -l ec2-user"
alias awsh="ssh -i .local/crc/kubeadm/aws/master_ssh_key -l ubuntu"
alias nukessh='for pid in $(sudo ps -a | grep ssh | sed "s/ \?\([0-9]*\).*/\1/g"); do kill $pid; done;'
