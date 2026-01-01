
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# user functions
export PATH=$PATH:/home/$USER/Repositories/dotfiles/bin:/usr/local/go/bin:$HOME/.local/bin

#
# Set some vars to ASCII
#
ASCII_BLOCK=█

#
# ANSI SEQUENCES
#

ANSICTRL='\033['
ANSICTRLEND='m'
ANSICTRLF='\033[%sm'

set_ansi(){ printf $ANSICTRLF $1; }

ANSIRESET=0
ANSIBOLD=1
ANSIBOLDOFF=21
ANSIFAINT=2
ANSIWEIGHTNORMAL=22
ANSIITALIC=3
ANSINOITALIC=23
ANSIUNDERLINE=4
ANSIDOUBLEUNDERLINE=21
ANSINOUNDERLINE=24
ANSISLOWBLINK=5
ANSIFASTBLINK=6
ANSINOBLINK=25
ANSIINVERT=7
ANSINOINVERT=27
ANSICONCEAL=8
ANSIREVEAL=28; ANSINOCONCEAL=28
ANSISTRIKE=9
ANSINOSTRIKE=29

## 4-BIT COLOUR CODES
FGBLACK=30
FGRED=31
FGGREEN=32
FGYELLOW=33
FGBLUE=34
FGMAGENTA=35
FGCYAN=36
FGWHITE=37
FGRGB=38
FGDEFAULT=39

BGBLACK=40
BGRED=41
BGGREEN=42
BGYELLOW=43
BGBLUE=44
BGMAGENTA=45
BGCYAN=46
BGWHITE=47

FGBRIGHTBLACK=90
FGBRIGHTRED=91
FGBRIGHTGREEN=92
FGBRIGHTYELLOW=93
FGBRIGHTBLUE=94
FGBRIGHTMAGENTA=95
FGBRIGHTCYAN=96
FGBRIGHTWHITE=97

BGBRIGHTBLACK=100
BGBRIGHTRED=101
BGBRIGHTGREEN=102
BGBRIGHTYELLOW=103
BGBRIGHTBLUE=104
BGBRIGHTMAGENTA=105
BGBRIGHTCYAN=106
BGBRIGHTWHITE=107

# THEME
UNAME_STYLE="$ANSIBOLD"
PWD_STYLE="$ANSIFAINT"
GITBRANCH_GLOBAL_STYLE=$ANSIITALIC
GITBRANCH_FAIL_STYLE=$ANSISTRIKE
GITBRANCH_SUCCESS_STYLE=$ANSINOSTRIKE

#
# CUSTOM PROMPT
#

gitbranch(){
	success_style=$(set_ansi "$GITBRANCH_GLOBAL_STYLE;$GITBRANCH_SUCCESS_STYLE")
	fail_style=$(set_ansi "$GITBRANCH_GLOBAL_STYLE;$GITBRANCH_FAIL_STYLE")
	reset_style=$(set_ansi "$ANSIRESET")
	branch=$(git branch --show-current 2>/dev/null || printf "gitbranch")
	style_to_use="$success_style"
	if [[ "$branch" == "gitbranch" ]]; then
		style_to_use="$fail_style"
	fi
	printf "${style_to_use}${branch}${reset_style}"
	return 0
}

PROMPT_COMMAND='\
	GIT_BRANCH=$(gitbranch) \
	PS1="\u  \W/ ${GIT_BRANCH} > "'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# vim4eva
EDITOR=vim

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# if we're ssh'ing, set the client IP as the host for the pulse-server and x-display
if [ -n "$SSH_CLIENT" ]; then
  sshclientip=$(echo $SSH_CLIENT | awk '{print $1}')
  export DISPLAY=$sshclientip:0 PULSE_SERVER=tcp:$sshclientip:4713
fi

# Welcome msg
df --block-size=GB /
printcolour
