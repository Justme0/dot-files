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
set -gx LLDB               /usr/bin/lldb-3.6
set -gx EDITOR             /usr/bin/vim
set PATH /home/justme0/Downloads/clpa/bin $PATH

#alias gac='git add --all --verbose; and git commit -v'
alias gac='git add --all :/ --verbose; and git commit -v'
alias gk='gitk --all --date-order'
alias gl='git pull'
alias gs='git status --short'
alias iv='info --vi-keys'
alias ll='ls -halF'
alias lt='ls -halFtr --full-time'
alias rm='sl'
alias sf='. ~/dot-files/config.fish'
alias t='gvfs-trash'
alias v='gvim'
alias vf='vi ~/dot-files/config.fish'
alias vv='vi ~/.vimrc'
alias gg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --date-order"
alias dus="du -sch * .* | sort -h" # in current dir

if test -f /usr/share/autojump/autojump.fish;
  . /usr/share/autojump/autojump.fish;
else if test -f ./.autojump/share/autojump/autojump.fish;
  . ./.autojump/share/autojump/autojump.fish;
end
