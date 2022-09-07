export LDFLAGS="-L /opt/homebrew/opt/openssl/lib"
export CPPFLAGS="-I /opt/homebrew/opt/openssl/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl/lib/pkgconfig"

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ls='ls -F --color'
alias la='ls -A'
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
# if ! shopt -oq posix; then
#   if [ -f /usr/share/bash-completion/bash_completion ]; then
#     . /usr/share/bash-completion/bash_completion
#   elif [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
#   fi
# fi

################## My conf ###############

PRIMARY_PROJ=~/

##########################################

HISTSIZE=50000
HISTFILESIZE=50000
export EDITOR=vim
bindkey -e
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export GCC_COLORS=1

alias lt='ls -ltarhF --color'
alias vi=vim
alias vv='vim ~/.vimrc'
alias vb='vim ~/.bashrc'
alias vz='vim ~/.zshrc'
alias sb='source ~/.bashrc'
alias sz='source ~/.zshrc'
alias gc='git config -l'
alias gl='git pull'
alias gs='git status'
alias gb='git branch -a'

# grep project
function g() {
    find . \( -name "*.min.*" -prune \) -o \( -name "build" -prune \) -o \( -name "shit" -prune \) -o \( -name "ft_local" -prune \) -o \( -name ".git" -prune \) -o \( -name "*.pb.h" -prune \) -o \( -name "*.pb.cc" -prune \) -o -type f -print0  | xargs -0 grep "$@" -nIw --color
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

export CHROME_LOG_FILE=/Users/taylorjiang/tmp/chrome_debug.log
export SSLKEYLOGFILE=/Users/taylorjiang/tmp/sslkey.log

