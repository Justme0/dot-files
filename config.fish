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

. /usr/share/autojump/autojump.fish
set -gx C_INCLUDE_PATH		/usr/include/x86_64-linux-gnu
set -gx CPLUS_INCLUDE_PATH	/usr/include/x86_64-linux-gnu
set -gx LD_LIBRARY_PATH		/usr/local/lib
set -gx GCC_COLORS		1
