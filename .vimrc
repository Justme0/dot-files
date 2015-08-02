"-----------------------------------for vundle plugin ---------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlp.vim'
Plugin 'morhetz/gruvbox'
Plugin 'suan/vim-instant-markdown'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"Plugin 'Valloric/YouCompleteMe'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"------------------------------------------------------------------------------------------

"set t_Co=256
"------------for color scheme--------------------------------------------------------------
" for coq color in dark background
autocmd FileType coq highlight SentToCoq ctermbg=17 guibg=#000045
set guifont=Consolas\ 12
"set guifont=Consolas\ 16

autocmd Filetype html setlocal ts=4 sts=4 sw=4
" gp conflict (the following has bug in %)
"autocmd Filetype html nnoremap gp :w<Enter>:!google-chrome %<Enter><Enter>

"let g:molokai_original=1
"let g:rehash256=1
"colorscheme molokai

"colorscheme evening

colorscheme gruvbox
set background=dark

" my config (no plugin)---------------------------------------------------------------
" remember last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" remember fold state
"au BufWinLeave ?* mkview
"au BufWinEnter ?* silent loadview

filetype indent on
filetype plugin on
" let g:CoqIDEDefaultKeyMap=1
set scrolloff=5
nnoremap <silent> <C-Up>	<Esc>:CoqIDEUndo<Enter>:set scrolloff=5<Enter>:vertical resize 76<Enter>
nnoremap <silent> <C-Down>	<Esc>:CoqIDENext<Enter>:set scrolloff=5<Enter>:vertical resize 76<Enter>
nnoremap <silent> <C-Right>	<Esc>:CoqIDEToCursor<Enter>:set scrolloff=5<Enter>:vertical resize 76<Enter>
nnoremap <silent> <F5>		<Esc>:w<Enter>:! coqc %<Enter>
inoremap <silent> <C-Up>	<Esc>:CoqIDEUndo<Enter>:set scrolloff=5<Enter>:vertical resize 76<Enter>
inoremap <silent> <C-Down>	<Esc>:CoqIDENext<Enter>:set scrolloff=5<Enter>:vertical resize 76<Enter>
inoremap <silent> <C-Right>	<Esc>:CoqIDEToCursor<Enter>:set scrolloff=5<Enter>:vertical resize 76<Enter>
inoremap <silent> <F5>		<Esc>:w<Enter>:! coqc %<Enter>

set number
set autoindent smartindent
set mouse=a
set incsearch
set clipboard=unnamedplus
set guioptions=
set cursorline
set showcmd
"set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set fileencodings=utf-8,utf-16,gbk,big5,gb18030,latin1

syntax enable
syntax on

inoremap { {<Enter>}<Esc>O
nnoremap <C-h> <Esc><C-w>h
nnoremap <C-j> <Esc><C-w>j
nnoremap <C-k> <Esc><C-w>k
nnoremap <C-l> <Esc><C-w>l
inoremap <C-h> <Esc><C-w>h
inoremap <C-j> <Esc><C-w>j
inoremap <C-k> <Esc><C-w>k
inoremap <C-l> <Esc><C-w>l
nnoremap j gj
nnoremap k gk


autocmd Filetype c nnoremap ,h <Esc>ggdGi#include <stdio.h><Enter><Enter>int main() {<Enter><Enter>return 0;<Enter>}<Esc>kkk
autocmd Filetype cpp nnoremap ,h <Esc>ggdGi#include <iostream><Enter><Enter>using std::cout;<Enter>using std::endl;<Enter><Enter>int main() {<Enter><Enter>return 0;<Enter>}<Esc>kkk

nnoremap ,= gg=G<C-o><C-o>
" clear
nnoremap ,c ggdG
nnoremap ,d :YcmCompleter GoToDefinitionElseDeclaration<CR>
" clear line
nnoremap ,l 0D
autocmd Filetype c nnoremap ,m :w<Enter>:make<Enter>:cw<Enter>:!./a.out<Enter>
autocmd Filetype cpp nnoremap ,m :w<Enter>:make<Enter>:cw<Enter>:!./a.out<Enter>
autocmd Filetype python nnoremap ,m :w<Enter>:make<Enter>
autocmd Filetype ruby nnoremap ,m :w<Enter>:make<Enter>
nnoremap ,n :cn<Enter>
nnoremap ,p :cp<Enter>
" replace
nnoremap ,r "_diwP
nnoremap ,s :so ~/.vimrc<Enter>

"----------------youcompleteme config------------------------------
"/usr/lib/vim-youcompleteme/ycm_extra_conf.py
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_key_invoke_completion='<M-;>'

"----------------vim-instant-markdown config----------------------
let g:instant_markdown_autostart = 0
"You can then manually trigger preview via the command :InstantMarkdownPreview.

"----------------ctrlp ------------------------------------
let g:ctrlp_by_filename = 1
