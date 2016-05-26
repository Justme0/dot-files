# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Custom plugins and themes may be added to ~/.oh-my-fish/custom
# Plugins and themes can be found at https://github.com/oh-my-fish/
Theme 'robbyrussell'
Plugin 'theme'
Plugin 'vi-mode'

set -gx C_INCLUDE_PATH     /usr/include/x86_64-linux-gnu
set -gx CPLUS_INCLUDE_PATH /usr/include/x86_64-linux-gnu
set -gx LD_LIBRARY_PATH    /usr/local/lib
set -gx GCC_COLORS         1
#set -gx LLDB               /usr/bin/lldb-3.6
set -gx EDITOR             /usr/bin/vim
set -gx LESS               -iR # http://stackoverflow.com/a/26069/1204713
#set -gx PAGER              most # apt-get install most
set -gx MANWIDTH           80
#set -gx BROWSER            chromium-browser

#enable the following when YCM git clone failed
#https://confluence.atlassian.com/stashkb/git-clone-fails-error-rpc-failed-result-56-http-code-200-693897332.html
#set -gx GIT_TRACE_PACKET   1
#set -gx GIT_TRACE          1
#set -gx GIT_CURL_VERBOSE   1

#set PATH /home/justme0/Downloads/clpa/bin $PATH

alias cp="cp -i"
alias mv="mv -i"
alias rm='shit' # please use gvfs-trash instread, remove to recycle bin

alias gac='git add --all :/ --verbose; and git commit -v'
alias gg="git log --date-order --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset'"
alias gga="git log --date-order --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset' --all"
alias gl='git pull'
#alias gs='git status --short'
alias gs='git status'
alias gd='git diff -w'

alias iv='info --vi-keys'

#alias ll='ls -halFv --time-style=long-iso'
alias ll='ls -halF --time-style=long-iso'
alias lt='ls -halF --time-style=long-iso -tr'

alias sf='. ~/dot-files/config.fish'
alias t='gvfs-trash'
alias tree='gvfs-tree'
alias v='gvim'
alias vf='vi ~/dot-files/config.fish' # link is ~/.config/fish/config.fish
alias vv='vi ~/.vimrc'
alias m='cd ~/programs/klee-base/; and make CPPFLAGS+=-DTOOL_DEBUG -j9; and cd testsuit; and ./test.py; and cd ..'

function ds
  if test (count $argv) = 0 # if given directory, du that
    du -sch ./* ./.* | sort -h
  else
    du -sch $argv/* $argv/.* | sort -h
  end
end

function gk
  gitk --date-order --all $argv &
end

if test -f /usr/share/autojump/autojump.fish;
  . /usr/share/autojump/autojump.fish;
else if test -f ./.autojump/share/autojump/autojump.fish;
  . ./.autojump/share/autojump/autojump.fish;
end
