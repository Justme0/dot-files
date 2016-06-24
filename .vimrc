" some useful Vim operation:

" 1. diff
" To begin diffing on all visible windows: :windo diffthis
" To end diff mode: :diffoff!

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
"Plugin 'vim-scripts/Conque-GDB' " use emacs gdb
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'morhetz/gruvbox'
Plugin 'dag/vim-fish'
Plugin 'vim-scripts/matchit.zip'
if filereadable(expand('~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'))
  Plugin 'Valloric/YouCompleteMe'
endif
"Plugin 'chase/vim-ansible-yaml'
"Plugin 'gilligan/vim-lldb'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'

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

"------------------------------------my config-------------------------------

" edit and compile for programming
inoremap {<CR> {<CR>}<Esc>O

autocmd Filetype ruby inoremap <buffer> do<CR>       do<CR>end<Esc>O
autocmd Filetype ruby inoremap <buffer> do<Space>    do<Space>\|<CR>end<Esc>k$a
autocmd Filetype ruby inoremap <buffer> class<Space> class<Space><CR>end<Esc>kA
"autocmd Filetype ruby inoremap <buffer> if<Space>    if<Space><CR>end<Esc>kA
autocmd Filetype ruby inoremap <buffer> def<Space>   def<Space><CR>end<Esc>kA
autocmd Filetype ruby inoremap <buffer> while<Space> while<Space><CR>end<Esc>kA

autocmd Filetype c,cpp inoremap <buffer> #in          #include<Space><><Esc>i
" class as template name:
"autocmd Filetype cpp   inoremap <buffer> class<Space> class<Space>{<CR>};<Esc>k$hi<space>
"autocmd Filetype cpp   inoremap <buffer> struct<Space> struct<Space>{<CR>};<Esc>k$hi<space>

autocmd Filetype c      nnoremap <buffer> ,m :w<CR>:silent !gvfs-trash -f %:p:h/a.out<CR>:set makeprg=gcc\ -std=c11\ \ -g\ -Wall\ -Wextra\ -o\ %:p:h/a.out\ %<CR>:make<CR>:!%:p:h/a.out<CR>
autocmd Filetype cpp    nnoremap <buffer> ,m :w<CR>:silent !gvfs-trash -f %:p:h/a.out<CR>:set makeprg=g++\ -std=c++14\ -g\ -Wall\ -Wextra\ -o\ %:p:h/a.out\ %<CR>:make<CR>:!%:p:h/a.out<CR>
autocmd Filetype ruby   nnoremap <buffer> ,m :w<CR>:set makeprg=ruby\ %<CR>:make<CR>
autocmd Filetype python nnoremap <buffer> ,m :w<CR>:set makeprg=python3\ %<CR>:make<CR>
autocmd Filetype lisp   nnoremap <buffer> ,m :w<CR>:set makeprg=emacs\ --no-site-file\ --script\ %<CR>:make<CR>
"autocmd Filetype tex    nnoremap <buffer> ,m :w<CR>:set makeprg=xelatex\ -output-directory=%:p:h\ %<CR>:make<CR>:!zathura %:r.pdf &<CR>
autocmd Filetype tex    nnoremap <buffer> ,m :w<CR>:set makeprg=xelatex\ -output-directory=%:p:h\ %<CR>:make<CR>

"function! RunTeX()
"  " !zathura %:r.pdf
"  if len(getqflist()) == 0
"    !zathura %:r.pdf
"  endif
"endfunction

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

autocmd VimResized * wincmd =
set history=2000
set scrolloff=5
set number
"set listchars=tab:\|\
"set list
set smartindent
autocmd Filetype c,cpp set cindent
set mouse=a
set incsearch
set hlsearch
nnoremap <silent> <esc> :noh<return><esc>
nnoremap <silent> <esc>^[ <esc>^[
set clipboard=unnamedplus
set guioptions=r
autocmd FileType tex set cursorcolumn
set showcmd
set showmode
set ruler
set wildmenu
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
" set fileencodings=utf-8,utf-16,gbk,big5,gb18030,latin1
set shell=/bin/bash
"set shellcmdflag=-ic
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro

set foldmethod=syntax
"autocmd BufRead,BufEnter * normal zR
autocmd BufRead * normal zR
set nofoldenable

" A tab produces a 2-space indentation
set softtabstop=2
set shiftwidth=2
set expandtab

syntax enable
syntax on

" fullscreen only in Linux, first `sudo apt-get install wmctrl'
function! ToggleFullScreen()
  call system("wmctrl -r :ACTIVE: -b toggle,fullscreen")
endfunction
noremap <silent> <F11> :call ToggleFullScreen()<CR>
inoremap <silent> <F11> <Esc>:call ToggleFullScreen()<CR>

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

nnoremap <space> :q<cr>

set cursorline
nnoremap j gjzz
nnoremap k gkzz
nnoremap ,, 0D

"nnoremap g= gg=G<C-o><C-o>:%s/\s\+$//<CR>:%s///g<cr>
nnoremap g= gg=G<C-o><C-o>:%s/\s\+$//<CR>
nnoremap gc :w<cr>:!clang-format -i %:p<cr>

nnoremap ,a ggdG
nnoremap \n :lnext<CR>
nnoremap \p :lprevious<CR>
nnoremap ,n :cn<CR>
nnoremap ,p :cp<CR>
nnoremap \r "_diwP
nnoremap gr Go<esc>pk"7dggzR
nnoremap ,t :cd ~/programs/test<CR>:e a.cpp<CR>
nnoremap gp :!git log -p --stat --follow -- %:p > /tmp/gitLogPatch<cr>:vsp /tmp/gitLogPatch<cr>

nnoremap ,s :source ~/.vimrc<CR>
nnoremap ,v :sp ~/.vimrc<CR>
autocmd! bufwritepost .vimrc source ~/.vimrc " reload vimrc once it's edited

nnoremap ,= =i{<C-o>
autocmd Filetype c      nnoremap ,h ggdGi#include <stdio.h><CR><CR>int main() {<CR><CR>return 0;<CR>}<Esc>gg
autocmd Filetype cpp    nnoremap ,h ggdGi#include <iostream><CR><CR>int main() {<CR><CR>return 0;<CR>}<Esc>gg
autocmd FileType ruby   nnoremap ,h ggdGi#!/usr/bin/env ruby<CR><CR><Esc>
autocmd FileType python nnoremap ,h ggdGi#!/usr/bin/env python3<CR># -*- coding: utf-8 -*-<CR><Esc>

"noremap <silent> <C-C> :call CommentLine()<CR>
function! CommentLine()
  if &ft == 'c' || &ft == 'cpp'
    if match(getline("."), "^[\t ]*//.*") == -1
      execute ":silent! normal I// \<ESC>hh\<down>"
    else
      execute ":silent! normal :nohlsearch\<CR>:s/\\/\\///\<CR>:nohlsearch\<CR>==\<down>"
    endif
  endif
endfunction

"-------- use LLVM style
" Highlight trailing whitespace and lines longer than 80 columns.
highlight LongLine ctermbg=Black guibg=Black
autocmd BufEnter,BufRead,Filetype c,cpp,ruby,python,vim,sh let w:m0=matchadd('LongLine', '\%>80v.\+', -1)
"highlight WhitespaceEOL ctermbg=Black guibg=Black

" Lines longer than 80 columns.
"autocmd BufWinEnter * let w:m0=matchadd('LongLine', '\%>80v.\+', -1)

" Whitespace at the end of a line. This little dance suppresses
" whitespace that has just been typed.
"autocmd BufWinEnter * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
"let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
" why the following always yield shit?
"autocmd InsertEnter * call matchdelete(w:m1)
" autocmd InsertEnter * let w:m2=matchadd('WhitespaceEOL', '\s\+\%#\@<!$', -1)
" autocmd InsertLeave * call matchdelete(w:m2)
"autocmd InsertLeave * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)

highlight ExtraWhitespace ctermbg=Black guibg=Black
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()

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
  autocmd! BufRead,BufNewFile *Makefile* set filetype=make
  autocmd! BufRead,BufNewFile *makefile* set filetype=make
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
  autocmd! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

" Enable syntax highlighting for tablegen files. To use, copy
" utils/vim/tablegen.vim to ~/.vim/syntax .
augroup filetype
  autocmd! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

" Enable syntax highlighting for reStructuredText files. To use, copy
" rest.vim (http://www.vim.org/scripts/script.php?script_id=973)
" to ~/.vim/syntax .
augroup filetype
  autocmd! BufRead,BufNewFile *.rst     set filetype=rest
augroup END

autocmd Filetype gitcommit setlocal spell textwidth=72

function! RubyInfo()
  ruby << EOF
    class A
    end
    puts A.new.class
    puts RUBY_VERSION
    puts RUBY_PLATFORM
    puts RUBY_RELEASE_DATE
EOF
endfunction

"------------------------------------my config end----------------

"------------------------------------coq-------------------------------------
autocmd FileType coq highlight SentToCoq ctermbg=17 guibg=#000045
autocmd FileType coq nnoremap <silent> <C-Up>	 <Esc>:CoqIDEUndo<CR>:set scrolloff=5<CR>:vertical resize 76<CR>
autocmd FileType coq nnoremap <silent> <C-Down>	 <Esc>:CoqIDENext<CR>:set scrolloff=5<CR>:vertical resize 76<CR>
autocmd FileType coq nnoremap <silent> <C-Right> <Esc>:CoqIDEToCursor<CR>:set scrolloff=5<CR>:vertical resize 76<CR>
autocmd FileType coq nnoremap <silent> <F5>	 <Esc>:w<CR>:! coqc %<CR>
autocmd FileType coq inoremap <silent> <C-Up>	 <Esc>:CoqIDEUndo<CR>:set scrolloff=5<CR>:vertical resize 76<CR>
autocmd FileType coq inoremap <silent> <C-Down>	 <Esc>:CoqIDENext<CR>:set scrolloff=5<CR>:vertical resize 76<CR>
autocmd FileType coq inoremap <silent> <C-Right> <Esc>:CoqIDEToCursor<CR>:set scrolloff=5<CR>:vertical resize 76<CR>
autocmd FileType coq inoremap <silent> <F5>	 <Esc>:w<CR>:! coqc %<CR>
"------------------------------------coq end---------------------------------

"----------------youcompleteme------------------------------------
"ycm compile lib
"cmake -G 'Unix Makefiles' -DEXTERNAL_LIBCLANG_PATH=/home/justme0/.vim/bundle/YouCompleteMe/third_party/ycmd/libclang.so . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp # note: may replace libclang.so position
"cmake --build . --target ycm_core --config Release

" if vim-youcompleteme	/usr/lib/vim-youcompleteme/ycm_extra_conf.py
" else			~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_invoke_completion = '<M-;>'
" let g:ycm_key_invoke_completion = '<S-Space>'
" let g:ycm_key_detailed_diagnostics = ',d'
" nnoremap \d :YcmDiags<CR>
" YCM default: let g:ycm_key_detailed_diagnostics = '<leader>d'
nnoremap ,c :YcmCompleter GoToDeclaration<CR>
"nnoremap ,p :YcmCompleter GetParent<CR> " conflict with :cp

if filereadable(expand('~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'))
  nnoremap ,d :YcmCompleter GoToImprecise<CR>
  "nnoremap ,d :YcmCompleter GoTo<CR>
  let g:ycm_global_ycm_extra_conf = '~/dot-files/.ycm_extra_conf.py'
  autocmd BufNewFile,BufRead *.c let g:ycm_global_ycm_extra_conf = '~/dot-files/.ycm_extra_conf_for_c.py'
elseif filereadable('/usr/lib/vim-youcompleteme/ycm_extra_conf.py')
  nnoremap ,d :YcmCompleter GoToDefinitionElseDeclaration<CR>
  let g:ycm_global_ycm_extra_conf = '~/dot-files/ycm_extra_conf.py'
  autocmd BufNewFile,BufRead *.c let g:ycm_global_ycm_extra_conf = '~/dot-files/ycm_extra_conf_for_c.py'
endif
autocmd FileType python nnoremap ,d :YcmCompleter GoTo<CR>
"----------------youcompleteme end---------------------------------

"----------------ctrlp---------------------------------------------
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 0

" for KLEE project
if expand("%:p") =~ "klee-base" || getcwd() =~ "klee-base"
  "if expand("%:p") =~ "klee-base" && (expand("%:p") =~ "include" || expand("%:p") =~ "lib")
  "  autocmd BufEnter,Filetype c,cpp set softtabstop=4
  "  autocmd BufEnter,Filetype c,cpp set shiftwidth=4
  "endif
  let g:ctrlp_custom_ignore = {
        \ 'dir': '\v(docs|_test|testsuit)$',
        \ 'file': '\v[^hp]$',
        \ }
endif
"----------------ctrlp end-----------------------------------------

"----------------ConqueGDB-----------------------------------------
"let g:ConqueGdb_SaveHistory = 1
"----------------ConqueGDB end-------------------------------------

"----------------ack for ag----------------------------------------
" sudo apt-get install silversearcher-ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Perl regex match whole word, use \b instead of \< in Vim
" special for KLEE:
" FIXME: head file's filetype is cpp
autocmd Filetype c   nnoremap <buffer> ,r :Ack --ignore-dir testsuit --case-sensitive --cc  -w <cword> <cr>
autocmd Filetype cpp nnoremap <buffer> ,r :Ack --ignore-dir testsuit --case-sensitive --cpp -w <cword> <cr>
"----------------ack for ag end------------------------------------

"----------------cscope--------------------------------------------
" extract from http://cscope.sourceforge.net/cscope_maps.vim
"if has("cscope")
"  " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
"  set cscopetag
"
"  " check cscope for definition of a symbol before checking ctags: set to 1
"  " if you want the reverse search order.
"  set csto=0
"
"  " add any cscope database in current directory
"  if filereadable("cscope.out")
"    cs add cscope.out
"    " else add the database pointed to by environment variable
"  elseif $CSCOPE_DB != ""
"    cs add $CSCOPE_DB
"  endif
"
"  " show msg when any other cscope db added
"  set cscopeverbose
"endif
"----------------cscope end----------------------------------------
