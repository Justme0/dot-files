# Path to Oh My Fish install.
set -q XDG_DATA_HOME
and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
or set -gx OMF_PATH "$HOME/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/justme0/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

fish_vi_key_bindings

if test -d ~/programs/mruby/bin
  set PATH ~/programs/mruby/bin $PATH
end

set -gx C_INCLUDE_PATH     /usr/include/x86_64-linux-gnu
set -gx CPLUS_INCLUDE_PATH /usr/include/x86_64-linux-gnu
set -gx LD_LIBRARY_PATH    /usr/local/lib
set -gx GCC_COLORS         1
#set -gx LLDB               /usr/bin/lldb-3.6
set -gx EDITOR             /usr/bin/vim
set -gx LESS               -iR # http://stackoverflow.com/a/26069/1204713
#set -gx PAGER              most # apt-get install most
set -gx MANWIDTH           72
#set -gx BROWSER            chromium-browser

#enable the following when YCM git clone failed
#https://confluence.atlassian.com/stashkb/git-clone-fails-error-rpc-failed-result-56-http-code-200-693897332.html
#set -gx GIT_TRACE_PACKET   1
#set -gx GIT_TRACE          1
#set -gx GIT_CURL_VERBOSE   1

. /usr/share/autojump/autojump.fish

# xmodmap ~/dot-files/.xmodmaprc # using /etc/default/keyboard

alias cp="cp -i"
alias mv="mv -i"
alias rm="NOTE: `rm` is dangerous, use `t` or `/bin/rm` instead."

alias iv='info --vi-keys'

#alias ll='ls -halFv --time-style=long-iso'
alias ll='ls -halF --time-style=long-iso'
alias lt='ls -halF --time-style=long-iso -tr'

alias sf='. ~/dot-files/config.fish'
alias e='emacs'
alias en='emacs -nw'
alias v='gvim'
# symbolic link is ~/.config/fish/config.fish
alias vf='vi ~/dot-files/config.fish'
alias vv='vi ~/.vimrc'

# KLEE project related
alias m='cd ~/programs/klee-base/; and make CPPFLAGS+=-DTOOL_DEBUG -j9; and cd testsuit; and ./test.py'
# NOTE: mt is a Linux command
# alias mt='cd ~/programs/klee-base/; and make CPPFLAGS+=-DTOOL_DEBUG -j9; and cd testsuit/transform_test/demo; and ./trans.rb demo1_if.c'

# git
alias gb='git branch -a'
# note gc is a command 'graph count'
alias gc='git config -l'
alias gac='git add --all :/ --verbose; and git commit -v'
#alias gg="git log --date-order --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset'"
alias gg="git log --date-order --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset' --all"
alias gl='git pull'
#alias gs='git status --short'
alias gs='git status'
alias gd='git diff -w'
# open conflict files when git merge
alias gm="git diff --name-only | uniq | xargs vi -p"
alias ds="~/dot-files/fish/ds.rb $argv"
alias tm="~/dot-files/fish/tm.rb $argv"

function gp
  if count $argv
    # a file's history
    git log -p --stat --follow -- $argv
  else
    git log -p --stat
  end
end

function gk
  gitk --date-order --all $argv &
end

if type gvfs-trash > /dev/null 2>&1
  alias t='gvfs-trash'
else
  # `sudo apt-get install trash-cli
  alias t='trash'
  # function t
  #   kioclient move $argv trash:/
  # end
end

if type gvfs-tree > /dev/null 2>&1
  alias tree='gvfs-tree'
end
