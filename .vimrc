"-----------------------------------vundle----------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
if filereadable('/home/justme0/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py')
	Plugin 'Valloric/YouCompleteMe'
endif

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

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
"-----------------------------------vundle end------------------------------------

"------------------------------------coq-------------------------------------
autocmd FileType coq highlight SentToCoq ctermbg=17 guibg=#000045
autocmd FileType coq nnoremap <silent> <C-Up>	<Esc>:CoqIDEUndo<Enter>:set scrolloff=5<Enter>:vertical resize 76<Enter>
autocmd FileType coq nnoremap <silent> <C-Down>	<Esc>:CoqIDENext<Enter>:set scrolloff=5<Enter>:vertical resize 76<Enter>
autocmd FileType coq nnoremap <silent> <C-Right>	<Esc>:CoqIDEToCursor<Enter>:set scrolloff=5<Enter>:vertical resize 76<Enter>
autocmd FileType coq nnoremap <silent> <F5>		<Esc>:w<Enter>:! coqc %<Enter>
autocmd FileType coq inoremap <silent> <C-Up>	<Esc>:CoqIDEUndo<Enter>:set scrolloff=5<Enter>:vertical resize 76<Enter>
autocmd FileType coq inoremap <silent> <C-Down>	<Esc>:CoqIDENext<Enter>:set scrolloff=5<Enter>:vertical resize 76<Enter>
autocmd FileType coq inoremap <silent> <C-Right>	<Esc>:CoqIDEToCursor<Enter>:set scrolloff=5<Enter>:vertical resize 76<Enter>
autocmd FileType coq inoremap <silent> <F5>		<Esc>:w<Enter>:! coqc %<Enter>
"------------------------------------coq end---------------------------------

"------------------------------------my config-------------------------------
autocmd Filetype c,cpp inoremap <buffer> { {<Enter>}<Esc>O
autocmd Filetype c,cpp nnoremap <buffer> ,m :w<Enter>:make<Enter>:cw<Enter>:!./a.out<Enter>
autocmd Filetype python,ruby nnoremap <buffer> ,m :w<Enter>:make<Enter>
autocmd Filetype html setlocal ts=4 sts=4 sw=4

set t_Co=256
set guifont=Courier\ 10\ Pitch\ 12
"colorscheme molokai
"let g:molokai_original=1
"let g:rehash256=1
colorscheme gruvbox
set background=dark
"colorscheme evening

if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype indent on
filetype plugin on
set history=2000
set scrolloff=5
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
set foldmethod=syntax
autocmd BufNewFile,BufRead * setlocal formatoptions=
autocmd BufRead * normal zR

syntax enable
syntax on

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
nnoremap ,, 0D
nnoremap ,= gg=G<C-o><C-o>
nnoremap ,d :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap ,l ggdG
nnoremap ,n :cn<Enter>
nnoremap ,p :cp<Enter>
nnoremap ,r "_diwP
nnoremap ,s :so ~/.vimrc<Enter>
nnoremap g= =i{<C-o>
nnoremap gc ggdGi#include <stdio.h><Enter><Enter>int main() {<Enter><Enter>return 0;<Enter>}<Esc>kkk
nnoremap gp ggdGi#include <iostream><Enter><Enter>using std::cout;<Enter>using std::endl;<Enter><Enter>int main() {<Enter><Enter>return 0;<Enter>}<Esc>kkk
"------------------------------------my config end---------------------------

"----------------youcompleteme------------------------------------
"if vim-youcompleteme	/usr/lib/vim-youcompleteme/ycm_extra_conf.py
"else			/home/justme0/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_invoke_completion = '<M-;>'
if filereadable('/home/justme0/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py')
	let g:ycm_global_ycm_extra_conf = '/home/justme0/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
endif
"----------------youcompleteme end---------------------------------

"----------------ctrlp---------------------------------------------
let g:ctrlp_by_filename = 1
"----------------ctrlp end-----------------------------------------
