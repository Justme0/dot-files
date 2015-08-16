# Path to your oh-my-zsh installation.
export ZSH=/home/justme0/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
# the following is same as bash style prompt
# ZSH_THEME="alanpeabody"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# alias time="/usr/bin/time -f '%E'"
# alias du='du -sch .[!.]* * | sort -h # for bash
# alias du='du -sch (.|)* | sort -h' # for zsh
alias gac='git add . ; git commit -v'
alias gk='gitk --all --date-order'
alias gl='git pull'
alias gs='git status --short'
alias i='sudo apt-get install'
alias info='info --vi-keys'
alias ll='ls -halF'
alias lt='ls -halFtr'
alias rm='sl'
alias sf='. ~/dot-files/config.fish'
alias sz='. ~/.zshrc'
alias t='gvfs-trash'
alias tree='gvfs-tree'
alias v='gvim'
alias vf='vi ~/dot-files/config.fish'
alias vv='vi ~/.vimrc'
alias vz='vi ~/.zshrc'
alias xm='xmodmap ~/.Xmodmap'

# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets
bindkey -v
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^n' down-history
bindkey '^p' up-history
bindkey '^r' history-incremental-search-backward
bindkey '^u' kill-whole-line
bindkey '^w' backward-kill-word

export KEYTIMEOUT=1
export C_INCLUDE_PATH=/usr/include/x86_64-linux-gnu
export CPLUS_INCLUDE_PATH=/usr/include/x86_64-linux-gnu
export LD_LIBRARY_PATH=/usr/local/lib
export GCC_COLORS=1
