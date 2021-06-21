inoremap jj <Esc>

nnoremap s <C-W>

syntax on
autocmd BufEnter *.tpp :setlocal filetype=cpp

set noerrorbells
set belloff=all

set autoindent
filetype plugin indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=0 "auto-indents match tabstop

" shows line numbers
set number

" set line width to 80 characters for c++ files
"au BufRead,BufNewFile *.cpp set textwidth=80
"au BufRead,BufNewFile *.h set textwidth=80

set nowrap
set incsearch

" wraps lines without splitting words
"set linebreak

au BufRead,BufNewFile makefile set noexpandtab

let check="VIMRC LOADED"
