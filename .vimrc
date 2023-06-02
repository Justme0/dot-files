"-----------------------------------vundle---------------------------------
" set nocompatible
" filetype off
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" Plugin 'gmarik/Vundle.vim'
" Plugin 'fatih/vim-go'
" " Plugin 'kien/ctrlp.vim'
" " Plugin 'mileszs/ack.vim'
" " Plugin 'vim-scripts/matchit.zip'
" " Plugin 'tomasr/molokai'
" " Plugin 'morhetz/gruvbox'
" " Plugin 'dag/vim-fish'
" " Plugin 'keith/tmux.vim'
" " Plugin 'justme0/llvm-vim-util'
" " Plugin 'scrooloose/nerdcommenter'
" " Plugin 'Valloric/YouCompleteMe'
" call vundle#end()
" filetype plugin indent on
"-----------------------------------vundle end-------------------------------

"------------------------------------my config-------------------------------
autocmd Filetype ruby inoremap <buffer> do<cr>       do<cr>end<Esc>O
autocmd Filetype ruby inoremap <buffer> do<Space>    do<Space>\|<cr>end<Esc>k$a
autocmd Filetype ruby inoremap <buffer> class<Space> class<Space><cr>end<Esc>kA
"autocmd Filetype ruby inoremap <buffer> if<Space>    if<Space><cr>end<Esc>kA
autocmd Filetype ruby inoremap <buffer> def<Space>   def<Space><cr>end<Esc>kA
autocmd Filetype ruby inoremap <buffer> while<Space> while<Space><cr>end<Esc>kA

" class as template name:
"autocmd Filetype cpp   inoremap <buffer> class<Space> class<Space>{<cr>};<Esc>k$hi<space>
"autocmd Filetype cpp   inoremap <buffer> struct<Space> struct<Space>{<cr>};<Esc>k$hi<space>

autocmd Filetype c      nnoremap <buffer> gl :w<cr>:!rm -f %:p:r.{bc,ll} && clang   -std=c11   -emit-llvm -g -c % -o %:p:r.bc && clang   -std=c11   -emit-llvm -g -S % -o %:p:r.ll<cr>:vs %:p:r.ll<cr>
autocmd Filetype cpp    nnoremap <buffer> gl :w<cr>:!rm -f %:p:r.{bc,ll} && clang++ -std=c++14 -emit-llvm -g -c % -o %:p:r.bc && clang++ -std=c++14 -emit-llvm -g -S % -o %:p:r.ll<cr>:vs %:p:r.ll<cr>

autocmd Filetype c      nnoremap <buffer> ,m :w<cr>:silent !/bin/rm -f %:p:h/a.out<cr>:set makeprg=gcc\ -std=gnu11\ -g\ -Wall\ -Wextra\ -o\ %:p:h/a.out\ %<cr>:make<cr>:!%:p:h/a.out<cr>
autocmd Filetype cpp    nnoremap <buffer> ,m :w<cr>:silent !/bin/rm -f %:p:h/a.out<cr>:set makeprg=g++\ -std=c++14\ -g\ -Wall\ -Wextra\ -o\ %:p:h/a.out\ %<cr>:make<cr>:!%:p:h/a.out<cr>
autocmd Filetype ruby   nnoremap <buffer> ,m :w<cr>:set makeprg=ruby\ -w\ %<cr>:make<cr>
autocmd Filetype go     nnoremap <buffer> ,m :w<cr>:set makeprg=go\ run\ %<cr>:make<cr>
autocmd Filetype python nnoremap <buffer> ,m :w<cr>:set makeprg=python3\ %<cr>:make<cr>
autocmd Filetype apl    nnoremap <buffer> ,m :w<cr>:set makeprg=apl\ -s\ -f\ %<cr>:make<cr>
autocmd Filetype lisp   nnoremap <buffer> ,m :w<cr>:set makeprg=emacs\ --no-site-file\ --script\ %<cr>:make<cr>
autocmd Filetype tex    nnoremap <buffer> ,m :w<cr>:let &makeprg='xelatex -output-directory=' . shellescape('%:p:h') . ' ' . fnameescape(expand('%:p'))<cr>:make<cr>
" :!zathura %:r.pdf &<cr>

"function! RunTeX()
"  " !zathura %:r.pdf
"  if len(getqflist()) == 0
"    !zathura %:r.pdf
"  endif
"endfunction

autocmd Filetype html setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype c setlocal shiftwidth=8

" set t_Co=256
" set guifont=Courier\ 10\ Pitch\ 12
" set guifont=Monospace\ 12
set guifont=WenQuanYi\ Micro\ Hei\ Mono\ 13
set background=dark
set guioptions=r

"============================== color ================================
" three colorscheme for you:

" let g:molokai_original=1
" let g:rehash256=1 " work only if &t_Co > 255
" :silent! colorscheme molokai

colorscheme zellner
:silent! colorscheme macvim "if have no the colorscheme, do nothing
:silent! colorscheme gruvbox
let g:gruvbox_contrast_dark='hard' " or soft, medium

set incsearch
set hlsearch
" highlight Search ctermbg=White ctermfg=Black
"============================== color end ============================

" go last open line
if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd VimResized * wincmd =
set display+=lastline
set history=2000
set scrolloff=5
set number
"set listchars=tab:\|\
"set list
set smartindent
autocmd Filetype c,cpp set cindent
set mouse=a
set backspace=indent,eol,start

nnoremap <silent> <esc> :noh<return><esc>
nnoremap <silent> <esc>^[ <esc>^[

"set clipboard=unnamedplus
set clipboard=unnamed

set showcmd
set showmode
set ruler
set wildmenu

" encoding
" set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
" set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set fileencoding=utf-8
set termencoding=utf-8
set encoding=utf-8

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
nnoremap <F11>      :call ToggleFullScreen()<cr>
inoremap <F11> <Esc>:call ToggleFullScreen()<cr>

nnoremap <C-h> <Esc><C-w>h
nnoremap <C-j> <Esc><C-w>j
nnoremap <C-k> <Esc><C-w>k
nnoremap <C-l> <Esc><C-w>l
inoremap <C-h> <Esc><C-w>h
inoremap <C-j> <Esc><C-w>j
inoremap <C-k> <Esc><C-w>k
inoremap <C-l> <Esc><C-w>l

nnoremap j gjzz
nnoremap k gkzz
vnoremap j gjzz
vnoremap k gkzz
nnoremap <down> gjzz
nnoremap <up> gkzz

" Mimic Emacs Line Editing in Insert Mode Only
inoremap <C-A> <Home>
inoremap <C-B> <Left>
inoremap <C-D> <del>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-K> <Esc>lDa
inoremap <C-U> <Esc>d0xi
inoremap <C-Y> <Esc>Pa
inoremap <C-N> <C-o>gj
inoremap <C-P> <C-o>gk
inoremap <C-X><C-S> <Esc>:w<CR>a
" edit and compile for programming
" inoremap {<cr> {<cr>}<Esc>O

" set cursorline
autocmd FileType tex set cursorcolumn
nnoremap ,, 0D
nnoremap <space> :q<cr>
nnoremap g= gg=G<C-o><C-o>:%s/\s\+$//<cr>
nnoremap ,a ggdG
nnoremap \n :lnext<cr>
nnoremap \p :lprevious<cr>
nnoremap ,n :cn<cr>
nnoremap ,p :cp<cr>
nnoremap \r "_diwP
nnoremap gr Go<esc>pk"7dggzR
nnoremap ,t :cd ~/programs/test<cr>:e a.cpp<cr>

function! GetGitLog()
ruby << EOF
system("git log -p -w --stat --follow -- #{Vim::Buffer.current.name} > /tmp/gitLogPatch") or abort
Vim::command("let @/ = expand('<cword>')")
Vim::command("vsp /tmp/gitLogPatch")
Vim::command("normal gg")
# Vim::command("normal N")
EOF
endfunction
nnoremap gp :call GetGitLog()<cr>

function! DiffToggle()
  if &diff
    diffoff!
  else
    windo diffthis
  endif
endfunction
nnoremap ,f :call DiffToggle()<cr>

nnoremap ,s :source ~/.vimrc<cr>
nnoremap ,v :sp ~/.vimrc<cr>
autocmd! bufwritepost .vimrc source ~/.vimrc " reload vimrc once it's edited

nnoremap ,= =i{<C-o>
autocmd Filetype c      nnoremap ,h ggdGi#include <stdio.h><cr><cr>int main() {<cr><cr>return 0;<cr>}<Esc>gg
autocmd Filetype cpp    nnoremap ,h ggdGi#include <iostream><cr><cr>int main() {<cr><cr>return 0;<cr>}<Esc>gg
autocmd FileType ruby   nnoremap ,h ggdGi#!/usr/bin/env ruby<cr><cr><Esc>
" autocmd FileType python nnoremap ,h ggdGi#!/usr/bin/env python2<cr># -*- coding: utf-8 -*-<cr><Esc>
autocmd FileType python nnoremap ,h ggdGi#!/usr/bin/env python3<cr><Esc>

nnoremap gc :w<cr>:!clang-format -i %:p<cr>
nnoremap <C-n> :call NERDComment("n", "Toggle")<cr>j
xnoremap <C-n> :call NERDComment("x", "Toggle")<cr>j
"noremap <silent> <C-C> :call CommentLine()<cr>
function! CommentLine()
  if &ft == 'c' || &ft == 'cpp'
    if match(getline("."), "^[\t ]*//.*") == -1
      execute ":silent! normal I// \<ESC>hh\<down>"
    else
      execute ":silent! normal :nohlsearch\<cr>:s/\\/\\///\<cr>:nohlsearch\<cr>==\<down>"
    endif
  endif
endfunction

"-------- use LLVM style
" Highlight trailing whitespace and lines longer than 80 columns.
"highlight LongLine ctermbg=Black guibg=Black
"autocmd BufEnter,BufRead,Filetype c,cpp,ruby,python,sh let w:m0=matchadd('LongLine', '\%>80v.\+', -1)
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
  autocmd! BufRead,BufNewFile *.apl set filetype=apl
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

function! GoToSrc()
ruby << EOF
# Check root according to Git.
def is_root(dir)
  File.directory?(dir + "/.git")
end

def get_brother(filename)
  return File.basename(filename, ".h") + ".cpp" if filename.end_with?(".h")
  return File.basename(filename, ".cpp") + ".h" if filename.end_with?(".cpp")
  abort "Unsupported file type"
end

filename = Vim::Buffer.current.name
brother = get_brother(filename)
puts "filename is " + filename
puts "brother is " + brother
dir = File.dirname(filename)
until is_root(dir)
  abort ".git not found." if dir == "/"
  dir = File.dirname(dir)
end
puts "dir is " + dir
brother_fullpath = `find #{dir} -name #{brother}`.split.last # a shit hack for ShapeChecker
p "brother_fullpath is " + brother_fullpath
if !brother_fullpath.empty?
  Vim::command("echo 'vs #{brother_fullpath}'")
  Vim::command("let @/ = '\\<' . expand('<cword>') . '\\>'")
  Vim::command("vs #{brother_fullpath}")
  Vim::command("normal gg")
  Vim::command("normal n")
else
  Vim::command("echo 'Good bye :)'")
end
EOF
endfunction
nnoremap ,e :call GoToSrc()<cr><cr>
"------------------------------------my config end----------------

"------------------------------------coq-------------------------------------
autocmd FileType coq highlight SentToCoq ctermbg=17 guibg=#000045
autocmd FileType coq nnoremap <silent> <C-Up>	 <Esc>:CoqIDEUndo<cr>:set scrolloff=5<cr>:vertical resize 76<cr>
autocmd FileType coq nnoremap <silent> <C-Down>	 <Esc>:CoqIDENext<cr>:set scrolloff=5<cr>:vertical resize 76<cr>
autocmd FileType coq nnoremap <silent> <C-Right> <Esc>:CoqIDEToCursor<cr>:set scrolloff=5<cr>:vertical resize 76<cr>
autocmd FileType coq nnoremap <silent> <F5>	 <Esc>:w<cr>:! coqc %<cr>
autocmd FileType coq inoremap <silent> <C-Up>	 <Esc>:CoqIDEUndo<cr>:set scrolloff=5<cr>:vertical resize 76<cr>
autocmd FileType coq inoremap <silent> <C-Down>	 <Esc>:CoqIDENext<cr>:set scrolloff=5<cr>:vertical resize 76<cr>
autocmd FileType coq inoremap <silent> <C-Right> <Esc>:CoqIDEToCursor<cr>:set scrolloff=5<cr>:vertical resize 76<cr>
autocmd FileType coq inoremap <silent> <F5>	 <Esc>:w<cr>:! coqc %<cr>
"------------------------------------coq end---------------------------------

"----------------youcompleteme------------------------------------
"ycm compile lib
" 1)
"cmake -G 'Unix Makefiles' -DEXTERNAL_LIBCLANG_PATH=/home/justme0/.vim/bundle/YouCompleteMe/third_party/ycmd/libclang.so . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp # note: may replace libclang.so position
" e.g.
"cmake -G 'Unix Makefiles' -DEXTERNAL_LIBCLANG_PATH=/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1 . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp

" 2)
"cmake --build . --target ycm_core --config Release -- -j7 # note: set -jN

" if vim-youcompleteme	/usr/lib/vim-youcompleteme/ycm_extra_conf.py
" else			~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py

let g:ycm_server_python_interpreter = 'python2'
let g:ycm_python_binary_path = 'python3'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_invoke_completion = '<M-;>'
" let g:ycm_key_invoke_completion = '<S-Space>'
" let g:ycm_key_detailed_diagnostics = ',d'
" nnoremap \d :YcmDiags<cr>
" YCM default: let g:ycm_key_detailed_diagnostics = '<leader>d'
"nnoremap ,p :YcmCompleter GetParent<cr> " conflict with :cp
"nnoremap ,d :YcmCompleter GoTo<cr>

let g:ycm_global_ycm_extra_conf = '~/dot-files/.ycm_extra_conf.py'
autocmd BufNewFile,BufRead *.c let g:ycm_global_ycm_extra_conf = '~/dot-files/.ycm_extra_conf_for_c.py'

function! OpenNewBufferIfNotModified()
  if !&modified
    sp
  endif
endfunction
nnoremap ,c :call OpenNewBufferIfNotModified()<cr>:YcmCompleter GoToDeclaration<cr>
nnoremap ,d :call OpenNewBufferIfNotModified()<cr>:YcmCompleter GoToImprecise<cr>
autocmd FileType python nnoremap ,d :call OpenNewBufferIfNotModified()<cr>:YcmCompleter GoTo<cr>
"----------------youcompleteme end---------------------------------

"----------------ctrlp---------------------------------------------
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 0

" for KLEE project
if expand("%:p") =~ "shapechecker" || getcwd() =~ "shapechecker"
  let g:ctrlp_custom_ignore = {
        \ 'dir': '\v(docs|_test|testsuit)$',
        \ 'file': '\v[^hp]$',
        \ }
  " autocmd Filetype c   nnoremap <buffer> ,m :w<cr>:let &makeprg='bash ~/programs/shapechecker/build/make.sh'<cr>:make<cr>
  autocmd Filetype cpp nnoremap <buffer> ,m :wa<cr>:let &makeprg='ninja -C ~/programs/shapechecker/build -j3 && shapechecker a.bc'<cr>:make<cr><cr>:cw<cr>
endif

" for dg project
if expand("%:p") =~ "/dg" || getcwd() =~ "/dg"
  let g:ctrlp_custom_ignore = {
        \ 'dir': '\v(html|tests|Testing)$',
        \ 'file': '\v[^hp]$',
        \ }
  " set softtabstop=4
  set shiftwidth=4
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
" autocmd Filetype c   nnoremap <buffer> ,r :Ack --ignore-dir testsuit --case-sensitive --cc  -w <cword> <cr>
" autocmd Filetype cpp nnoremap <buffer> ,r :Ack --ignore-dir testsuit --case-sensitive --cpp -w <cword> <cr>
nnoremap ,r :Ack --ignore-dir testsuit --ignore-dir webGUI --case-sensitive -w <cword> <cr>
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

"----------------nerdcommenter-----------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'both'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_c = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
"----------------nerdcommenter end-------------------------------

"----------------airline-----------------------------------------
" let g:airline#extensions#tabline#enabled = 1
"----------------airline end-------------------------------------

" highlight DiffAdd    cterm=NONE ctermfg=0 ctermbg=22
" highlight DiffDelete cterm=NONE ctermfg=0 ctermbg=52
" highlight DiffChange cterm=NONE ctermfg=0 ctermbg=23
" highlight DiffText   cterm=NONE ctermfg=0 ctermbg=23

if (expand("%:p") =~ "/thesis/" || getcwd() =~ "/thesis/")
" && has("gui_running")
  set guifont=WenQuanYi\ Micro\ Hei\ Mono\ 16
  colorscheme default
  set background=light
  " highlight Normal guifg=#ffe0e0
  " highlight Normal ctermfg=black ctermbg=red
  nnoremap gm :sp ~/Documents/thesis/jiangg/main.tex<cr>
  " autocmd Filetype tex    nnoremap <buffer> ,m :w<cr>:let &makeprg='bash ~/Documents/thesis/jiang/make.sh'<cr>:make<cr>
  nnoremap ,m :wa<cr>:cd ~/Documents/thesis/jiang<cr>:let &makeprg='bash ~/Documents/thesis/jiang/make.sh'<cr>:make<cr>

  "----------------input mode switch-------------------------------
  " from http://fcitx.github.io/handbook/chapter-remote.html
  " to review: https://github.com/lilydjwg/fcitx.vim
  let g:input_toggle = 1
  function! Fcitx2en()
     let s:input_status = system("fcitx-remote")
     if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system("fcitx-remote -c")
     endif
  endfunction

  function! Fcitx2zh()
     let s:input_status = system("fcitx-remote")
     if s:input_status != 2 && g:input_toggle == 1
        let l:a = system("fcitx-remote -o")
        let g:input_toggle = 0
     endif
  endfunction

  set timeoutlen=800
  autocmd InsertLeave * call Fcitx2en()
  autocmd InsertEnter * call Fcitx2zh()
  "----------------input mode switch end---------------------------

  let g:ctrlp_custom_ignore = {
        \ 'dir': '\vfigures$',
        \ 'file': '\v([^xb]|aux)$',
        \ }
endif

inoremap <down> <C-o>gj
inoremap <up> <C-o>gk
