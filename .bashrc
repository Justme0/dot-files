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
# HISTSIZE=1000
# HISTFILESIZE=2000

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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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

################## My conf ###############

PRIMARY_PROJ=~/

##########################################

HISTSIZE=50000
HISTFILESIZE=50000
export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export GCC_COLORS=1

alias lt='ls -ltarhF --color'
alias vi=vim
alias vv='vim ~/.vimrc'
alias vb='vim ~/.bashrc'
alias sb='source ~/.bashrc'
alias gc='git config -l'
alias gl='git pull'
alias gs='git status'
alias gb='git branch -a'

# grep project
function g() {
    find \( -name "*.min.*" -prune \) -o \( -name "build" -prune \) -o \( -name "shit" -prune \) -o \( -name "ft_local" -prune \) -o \( -name ".git" -prune \) -o \( -name "*.pb.h" -prune \) -o \( -name "*.pb.cc" -prune \) -o -type f -print0  | xargs -0 grep "$@" -nIw --color
}

# grep proto
function gpr() {
    find -name "*.proto" -print0  | xargs -0 grep "$@" -nIw --color
}

# git log concise
function gg() {
    git log --date-order --graph --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s %Cgreen%cd%Creset %C(bold blue)%an%Creset' --all --color --date=format-local:'%Y-%m-%d %H:%M:%S %a' "$@"
}

# git log patch
unalias gp 2>/dev/null
function gp() {
    git log -p --stat --color --date=format-local:'%Y-%m-%d %H:%M:%S %a' "$@"
}

# jump to primary directory
function j() {
    cd $PRIMARY_PROJ
}

# find file name
function ff() {
    find | grep "$@"
}

export PATH="$PATH:$HOME/.ft"

# trash to tmp dir
function t() {
    mkdir -p ~/tmp

    for trash in "$@"; do
        echo "To trash to tmp: $trash"
        mv -f "$trash" ~/tmp/"$trash"_$(date +%Y-%m-%d_%H:%M:%S)
    done
}

# git diff
function gd() {
    mkdir -p ~/tmp/
    git diff "$@" > ~/tmp/shitdiff.diff
    vim ~/tmp/shitdiff.diff +1
}

# process grep
function p() {
    ps -eo pid,ppid,lstart,cmd | head -n 1
    ps -eo pid,ppid,lstart,cmd | grep -v grep | grep -i --color=always "$@"
}
