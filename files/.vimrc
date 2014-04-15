set nocompatible

syntax on
filetype plugin on
filetype indent on

set autoindent
set showmode
set number
set smartindent
set shiftwidth=2
set expandtab
set tabstop=2
set backspace=2
set hlsearch
set textwidth=80
set formatoptions=nqro
set bg=dark

" Undo file.
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" Highlight column 81.
set colorcolumn=81
highlight ColorColumn ctermbg=3

" Highlight extra whitespace and tabs.
highlight ExtraWhitespace ctermbg=3
match ExtraWhitespace /\s\+$\|\t\+/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=3

" Remember last cursor position.
set viminfo='10,\"100,:20,%,n~/.viminfo
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |
    \ exe "normal! g'\"" | endif

" Use tab to navigate splits.
nnoremap <tab> <C-w><C-w>

" Move multiple lines at once.
nnoremap <C-j> 10j
nnoremap <C-k> 10k
nnoremap <C-l> 10l
nnoremap <C-h> 10h
vnoremap <C-j> 10j
vnoremap <C-k> 10k
vnoremap <C-l> 10l
vnoremap <C-h> 10h

" Make Y work like D.
nnoremap Y y$

" Create newlines in normal mode.
nnoremap <cr> o<esc>

" Pathogen fun.
call pathogen#infect()

" Folding.
set foldmethod=indent
set foldnestmax=2
set nofoldenable
nnoremap <space> za

" NERDTree.
noremap <C-n> :NERDTreeToggle<cr>
let g:NERDTreeDirArrows=0

" For NERDCommenter.
let mapleader = ","
let g:NERDSpaceDelims = 1

" Bash style completion.
set wildmode=list:longest
set wildmenu
