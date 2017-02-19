# Remove shit time right prompt in oh-my-fish.
# Override fish_right_prompt function in
# ~/.local/share/omf/themes/default/fish_right_prompt.fish.
function fish_right_prompt
end

# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/justme0/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

fish_vi_key_bindings

set PATH /usr/local/cuda/bin ~/programs/klee-base/bin ~/dot-files/bin /sbin /usr/local/sbin /usr/sbin $PATH

# klee-base related
set -gx C_INCLUDE_PATH     /usr/include/x86_64-linux-gnu
set -gx CPLUS_INCLUDE_PATH /usr/include/x86_64-linux-gnu
set -gx LD_LIBRARY_PATH    /usr/local/lib /usr/local/cuda/lib64

set -gx GCC_COLORS         1
#set -gx LLDB               /usr/bin/lldb-3.6
set -gx EDITOR             /usr/bin/vim
set -gx LESS               -iR # http://stackoverflow.com/a/26069/1204713
#set -gx PAGER              most # apt-get install most
set -gx MANWIDTH           72
#set -gx BROWSER            chromium-browser

# YouCompleteMe related
#enable the following when YCM git clone failed
#https://confluence.atlassian.com/stashkb/git-clone-fails-error-rpc-failed-result-56-http-code-200-693897332.html
#set -gx GIT_TRACE_PACKET   1
#set -gx GIT_TRACE          1
#set -gx GIT_CURL_VERBOSE   1

. /usr/share/autojump/autojump.fish

alias jt='cd ~/programs/test'
alias cp='cp -i'
alias mv='mv -i'
function rm
  echo NOTE: `rm` is dangerous. Use `t` or `/bin/rm` instead.
end

alias iv='info --vi-keys'

#alias ll='ls -halFv --time-style=long-iso'
alias ll='ls -halF --time-style=long-iso'
alias lt='ls -halF --time-style=long-iso -tr'

alias sf='. ~/dot-files/config.fish'
alias e='emacs'
alias en='emacs -nw'
function eg
  emacs --eval "( gdb \" gdb -i=mi --args $argv \" )" &
end
function eng
  emacs -nw --eval "( gdb \" gdb -i=mi --args $argv \" )" &
end

alias v='gvim'
# symbolic link is ~/.config/fish/config.fish
alias vf='vi ~/dot-files/config.fish'
alias vv='vi ~/.vimrc'

# KLEE project related
function m
  pushd .
  cd ~/programs/klee-base/build
  cmake --build . -- -j9
  if test $status -eq 0
    popd
  else
    cd ..
  end
end
# regression test for klee-base
alias mt='m; and cd ~/programs/klee-base/testsuit; and ./test.py'
# alias mk='cd ~/programs/klee-base/build; cmake --build . -- -j9; and cd ../testsuit; and ./test.py; cd ~/programs/klee-base'

# NOTE: mt is a Linux command
# alias mt='cd ~/programs/klee-base/; and make CPPFLAGS+=-DTOOL_DEBUG -j9; and cd testsuit/transform_test/demo; and ./trans.rb demo1_if.c'
# alias md='cd ~/programs/dg/; and cmake --build . -- -j9; and cd tools'

# git
alias gb='git branch -a'
# note gc is a command 'graph count'
alias gc='git config -l'
# alias gco='git checkout' # TODO: gco <tab> failed
alias gac='git add --all --verbose; and git commit -v'
#alias gg="git log --author-date-order --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ai) %C(bold blue)<%an>%Creset'"
alias gg="git log --author-date-order --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ai) %C(bold blue)<%an>%Creset' --all"
alias gl='git pull'
#alias gs='git status --short'
alias gs='git status'
alias gd='git diff -w'
# open conflict files when git merge
alias gm="git diff --name-only | uniq | xargs vi -p"

function gp
  if count $argv >/dev/null
    # a file's history
    git log -p --stat -w --follow -- $argv
  else
    git log -p --stat -w
  end
  return 0
end

function z
  zathura $argv > /dev/null 2>&1 &
end

function pp
  ps --sort=-pcpu -eo pcpu,comm,pid,user | head -n 11
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

git config --global core.excludesfile ~/dot-files/.gitignore_global
