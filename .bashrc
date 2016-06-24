# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
    xterm-color) color_prompt=yes;;
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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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

## ------------------------------
## -- 1) Autocomplete Git Commands  --
## ------------------------------

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

## ------------------------------
## -- 2) Git Aware Prompt  --
## ------------------------------

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
tty -s && export PS1="\[\033[0;32m\][\u@\h:\W]\[\033[0m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

##------------------------------
## -- 3) User-customized code  --
## ------------------------------

## Define any user-specific variables you want here.
#source ~/.bashrc_custom

alias pxupdate="sudo proxychains apt-get update && sudo proxychains apt-get upgrade && sudo proxychains apt-get dist-upgrade && sudo apt-get autoremove && sudo apt-get autoclean"
alias update="sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove && sudo apt-get autoclean"
alias kerio-start="sudo /etc/init.d/kerio-kvc start"
alias kerio-stop="sudo /etc/init.d/kerio-kvc stop"
alias emacs="emacs -nw"
alias unpm="npm install -g npm && sudo rm /usr/bin/npm && sudo ln -s /home/daniel/software/npm/lib/node_modules/npm/bin/npm-cli.js /usr/bin/npm"
alias avval_connect="ssh root@mci -L 3377:localhost:3377 -L 9200:localhost:9200 -L 27021:localhost:27017 -L 3306:localhost:3306 -L 8090:172.17.251.18:8090" 
alias market-connect="ssh root@market -L 3307:localhost:3306 -L 9090:localhost:9090"
alias connect_vm01="ssh root@17-afranet -L 6011:localhost:6011 -L 8090:172.17.42.1:8090 -L 6101:localhost:6101"
alias connect_vm02="ssh root@18-afranet"
alias app-server="ssh root@app-server -L 8090:172.17.251.18:8090 -L 3308:172.17.05:3306"
alias stunnel="sh /home/daniel/software/tunnel.sh"
alias dc="docker-compose"
alias tunnel="sslocal -c software/config.json"
alias ttunnel="sshuttle -r daniel@us-vps 0.0.0.0/0 -vv"
alias sdkup="sh ~/software/android.sh"
