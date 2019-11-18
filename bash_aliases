
#!/bin/sh
alias gpuusage="watch -n 0.5 nvidia-smi"
alias bsrc="source ~/.bashrc"
alias top="htop"
alias cdgo="cd ~/go/src/ && cd"


# prettier docker ps
# SET_PROMPT_COLOR and COLOR vars come from custom bashrc{
cyan=$(SET_PROMPT_COLOR ${COLOR_CYAN})
blue=$(SET_PROMPT_COLOR ${COLOR_BLUE})
lightblue=$(SET_PROMPT_COLOR ${COLOR_LIGHT_BLUE})
formatString="{{printf \"${lightblue}%-30s ${cyan}%-30s %s\" .Names .Ports .Status}}"

dps(){
  printf "${lightblue}%-30s %-30s %s\n" "Name" "Ports" "Status"
  docker ps -a --format="${formatString}"
}

