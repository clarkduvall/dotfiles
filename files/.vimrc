syntax on
filetype plugin on

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

" Pathogen fun.
call pathogen#infect()

" Folding.
setlocal foldmethod=syntax
setlocal foldnestmax=2
setlocal nofoldenable
nnoremap <space> za
