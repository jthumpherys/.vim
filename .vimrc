
" key bindings
inoremap jj <Esc>
nnoremap s <C-W>
vnoremap . <Esc>

" indentation
set autoindent
filetype plugin indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=0 "auto-indents match tabstop

" misc
syntax on
set number
set nowrap
set incsearch
set noerrorbells
set belloff=all
set colorcolumn=100
highlight ColorColumn ctermbg=13

" C++
autocmd BufEnter *.tpp :setlocal filetype=cpp

" makefiles
au BufRead,BufNewFile makefile set noexpandtab

let check="VIMRC LOADED"
