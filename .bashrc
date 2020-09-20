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

alias lt='ls -ltarh'
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
    find \( -name "*.min.*" -prune \) -o \( -name "build" -prune \) -o \( -name "shit" -prune \) -o \( -name "ft_local" -prune \) -o \( -name ".git" -prune \) -o \( -name "*.pb.h" -prune \) -o \(
-name "*.pb.cc" -prune \) -o -type f -print0  | xargs -0 grep "$@" -nIw --color
}

# grep proto
function gpb() {
    find -name "*.proto" -print0  | xargs -0 grep "$@" -nIw --color
}

# git log concise

function gg() {
    git log --date-order --graph --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s %Cgreen%cd%Creset %C(bold blue)%an%Creset' --all --color --date=format-local:'%Y-%m-%d %H:%M:%S %a' "$@"
}

# git log patch
unalias gp
function gp() {
    git log -p --stat --color --date=format-local:'%Y-%m-%d %H:%M:%S %a' "$@"
}

# jump to primary directory
function j() {
    cd $PRIMARY_PROJ
}

# find file name
function ff() {
    # cd $PRIMARY_PROJ; find -type f | grep "$@"; cd - > /tmp/shitcd
    find | grep "$@"
}

export PATH="$PATH:$HOME/.ft"

# trash to tmp dir
function t() {
    mkdir -p ~/tmp
    mv -f "$@" ~/tmp/"$@"_$(date +%Y-%m-%d_%H:%M:%S)
}

# git diff
function gd() {
    mkdir -p ~/tmp/
    # git diff --ignore-space-at-eol "$@" > ~/tmp/shitdiff.diff
    git diff "$@" > ~/tmp/shitdiff.diff
    vim ~/tmp/shitdiff.diff +1
}

# process grep
function p() {
    ps -eo pid,ppid,lstart,cmd | head -n 1
    ps -eo pid,ppid,lstart,cmd | grep -v grep | grep -i --color=always "$@"
}
