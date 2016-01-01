"-----------------------------------vundle---------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
" Plugin 'scrooloose/nerdcommenter'
" Plugin 'gilligan/vim-lldb'
if filereadable(expand('~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'))
  Plugin 'Valloric/YouCompleteMe'
endif

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
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
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"-----------------------------------vundle end-------------------------------

"------------------------------------coq-------------------------------------
autocmd FileType coq highlight SentToCoq ctermbg=17 guibg=#000045
autocmd FileType coq nnoremap <silent> <C-Up>		<Esc>:CoqIDEUndo<CR>:set scrolloff=5<CR>:vertical resize 76<CR>
autocmd FileType coq nnoremap <silent> <C-Down>		<Esc>:CoqIDENext<CR>:set scrolloff=5<CR>:vertical resize 76<CR>
autocmd FileType coq nnoremap <silent> <C-Right>	<Esc>:CoqIDEToCursor<CR>:set scrolloff=5<CR>:vertical resize 76<CR>
autocmd FileType coq nnoremap <silent> <F5>		<Esc>:w<CR>:! coqc %<CR>
autocmd FileType coq inoremap <silent> <C-Up>		<Esc>:CoqIDEUndo<CR>:set scrolloff=5<CR>:vertical resize 76<CR>
autocmd FileType coq inoremap <silent> <C-Down>		<Esc>:CoqIDENext<CR>:set scrolloff=5<CR>:vertical resize 76<CR>
autocmd FileType coq inoremap <silent> <C-Right>	<Esc>:CoqIDEToCursor<CR>:set scrolloff=5<CR>:vertical resize 76<CR>
autocmd FileType coq inoremap <silent> <F5>		<Esc>:w<CR>:! coqc %<CR>
"------------------------------------coq end---------------------------------

"------------------------------------my config-------------------------------

" edit and compile for programming
inoremap {<CR> {<CR>}<Esc>O
autocmd Filetype ruby inoremap <buffer> do<CR>		do<CR>end<Esc>O
autocmd Filetype ruby inoremap <buffer> do<Space>	do<Space><CR>end<Esc>kA
autocmd Filetype ruby inoremap <buffer> module<Space>	module<Space><CR>end<Esc>kA
autocmd Filetype ruby inoremap <buffer> class<Space>	class<Space><CR>end<Esc>kA
autocmd Filetype ruby inoremap <buffer> def<Space>	def<Space><CR>end<Esc>kA
autocmd Filetype ruby inoremap <buffer> while<Space>	while<Space><CR>end<Esc>kA

autocmd Filetype c	nnoremap <buffer> ,m :w<CR>:set makeprg=gcc\ -std=c11\ -g\ -Wall\ -Wextra\ %<cr>:make<CR>:!./a.out<CR>
autocmd Filetype cpp	nnoremap <buffer> ,m :w<CR>:set makeprg=g++\ -std=c++14\ -g\ -Wall\ -Wextra\ %<cr>:make<CR>:!./a.out<CR>
autocmd Filetype ruby	nnoremap <buffer> ,m :w<CR>:set makeprg=ruby\ %<cr>:make<CR>:cw<CR>
autocmd Filetype python	nnoremap <buffer> ,m :w<CR>:set makeprg=python2\ %<cr>:make<CR>:cw<CR>
" TODO: tex map ,m
autocmd Filetype tex	nnoremap <buffer> ,m :w<CR>:!xelatex % && zathura program_transformation.pdf &<cr>
autocmd Filetype html setlocal ts=4 sts=4 sw=4

"set t_Co=256
"set guifont=Courier\ 10\ Pitch\ 12
set guifont=Monospace\ 11

"let g:molokai_original=1
"let g:rehash256=1
"colorscheme molokai

"colorscheme evening
colorscheme gruvbox
set background=dark

" go last open line
if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set history=2000
set scrolloff=5
set number
"set listchars=tab:\|\
"set list
set smartindent
au Filetype c,cpp set cindent
set mouse=a
set incsearch
set hlsearch
nnoremap <silent> <esc> :noh<return><esc>
nnoremap <silent> <esc>^[ <esc>^[
set clipboard=unnamedplus
set guioptions=r
set cursorline
autocmd FileType tex set cursorcolumn
set showcmd
set showmode
set ruler
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
" set fileencodings=utf-8,utf-16,gbk,big5,gb18030,latin1
set shell=/bin/bash
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro

set foldmethod=syntax
autocmd BufRead,BufEnter * normal zR
set nofoldenable

" A tab produces a 2-space indentation
set softtabstop=2
set shiftwidth=2
set expandtab

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
nnoremap <down> g<down>
nnoremap <up> g<up>
inoremap <down> <C-o>g<down>
inoremap <up> <C-o>g<up>
nnoremap j gj
nnoremap k gk
nnoremap ,, 0D
nnoremap g= gg=G<C-o><C-o>:%s/\s\+$//<cr>
nnoremap ,a ggdG
nnoremap \n :lnext<CR>
nnoremap \p :lprevious<CR>
nnoremap ,n :cn<CR>
nnoremap ,p :cp<CR>
nnoremap ,r "_diwP
nnoremap gr Go<esc>pk"7dggzR
nnoremap ,t :cd ~/programs/test<cr>:e a.cpp<cr>
nnoremap ,s :so ~/.vimrc<CR>
nnoremap ,= =i{<C-o>
autocmd Filetype c      nnoremap ,h ggdGi#include <stdio.h><CR><CR>int main() {<CR><CR>return 0;<CR>}<Esc>kkk
autocmd Filetype cpp    nnoremap ,h ggdGi#include <iostream><CR><CR>int main() {<CR><CR>return 0;<CR>}<Esc>kkk
autocmd FileType ruby   nnoremap ,h ggdGi#! /usr/bin/env ruby<CR><CR><Esc>
autocmd FileType python nnoremap ,h ggdGi#! /usr/bin/env python2<CR><CR><Esc>

noremap <silent> <C-c> :call CommentLine()<CR>
function! CommentLine()
  if &ft == 'c' || &ft == 'cpp'
    if match(getline("."), "^[\t ]*//.*") == -1
      " you should press '0' first (TODO)
      execute ":silent! normal i// \<ESC>hh\<down>"
    else
      execute ":silent! normal :nohlsearch\<CR>:s/\\/\\///\<CR>:nohlsearch\<CR>==\<down>"
    endif
  endif
endfunction

"-------- use LLVM style
" Highlight trailing whitespace and lines longer than 80 columns.
highlight LongLine ctermbg=DarkBlue guibg=DarkBlue
highlight WhitespaceEOL ctermbg=DarkBlue guibg=DarkBlue

" Lines longer than 80 columns.
"au BufWinEnter * let w:m0=matchadd('LongLine', '\%>80v.\+', -1)
au Filetype c,cpp,ruby,python,vim let w:m0=matchadd('LongLine', '\%>80v.\+', -1)

" Whitespace at the end of a line. This little dance suppresses
" whitespace that has just been typed.
au BufWinEnter * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
au InsertEnter * call matchdelete(w:m1)
au InsertEnter * let w:m2=matchadd('WhitespaceEOL', '\s\+\%#\@<!$', -1)
au InsertLeave * call matchdelete(w:m2)
au InsertLeave * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)

" Set a few indentation parameters. See the VIM help for cinoptions-values for
" details.  These aren't absolute rules; they're just an approximation of
" common style in LLVM source.
set cinoptions=:0,g0,(0,Ws,l1,N-s
"set cinoptions=N-s,g0,+0	" cpp: no indent for namespace; 'public'; template in brace
" Add and delete spaces in increments of `shiftwidth' for tabs
set smarttab

" LLVM Makefiles can have names such as Makefile.rules or TEST.nightly.Makefile,
" so it's important to categorize them as such.
augroup filetype
  au! BufRead,BufNewFile *Makefile* set filetype=make
augroup END

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs
autocmd FileType make set noexpandtab

" Useful macros for cleaning up code to conform to LLVM coding guidelines

" Delete trailing whitespace and tabs at the end of each line
command! DeleteTrailingWs :%s/\s\+$//

" Convert all tab characters to two spaces
command! Untab :%s/\t/  /g

" Enable syntax highlighting for LLVM files. To use, copy
" utils/vim/llvm.vim to ~/.vim/syntax .
augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

" Enable syntax highlighting for tablegen files. To use, copy
" utils/vim/tablegen.vim to ~/.vim/syntax .
augroup filetype
  au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

" Enable syntax highlighting for reStructuredText files. To use, copy
" rest.vim (http://www.vim.org/scripts/script.php?script_id=973)
" to ~/.vim/syntax .
augroup filetype
  au! BufRead,BufNewFile *.rst     set filetype=rest
augroup END
"------------------------------------my config end----------------

"----------------youcompleteme------------------------------------
" if vim-youcompleteme	/usr/lib/vim-youcompleteme/ycm_extra_conf.py
" else			~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_invoke_completion = '<M-;>'
" let g:ycm_key_detailed_diagnostics = '<leader>d'
nnoremap \m :YcmDiags<CR>
nnoremap ,c :YcmCompleter GoToDeclaration<CR>
if filereadable(expand('~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'))
  nnoremap ,d :YcmCompleter GoToImprecise<CR>
  let g:ycm_global_ycm_extra_conf = '~/dot-files/.ycm_extra_conf.py'
elseif filereadable('/usr/lib/vim-youcompleteme/ycm_extra_conf.py')
  nnoremap ,d :YcmCompleter GoToDefinitionElseDeclaration<CR>
  let g:ycm_global_ycm_extra_conf = '~/dot-files/ycm_extra_conf.py'
endif
"----------------youcompleteme end---------------------------------

"----------------ctrlp---------------------------------------------
let g:ctrlp_by_filename = 1
"----------------ctrlp end-----------------------------------------
