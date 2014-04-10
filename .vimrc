set autoindent
set showmode
set number
set smartindent
set shiftwidth=2
set expandtab
set tabstop=2
set backspace=2
set hlsearch
set colorcolumn=81
hi ColorColumn ctermbg=3
setlocal formatoptions=ctnqro
setlocal comments+=n:*,n:#
syntax on
highlight Comment ctermfg=blue
highlight ExtraWhitespace ctermbg=3
match ExtraWhitespace /\s\+$/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=3

map ,# :s/^/#/<CR>
map ,/ :s/^/\/\//<CR>

set viminfo='10,\"100,:20,%,n~/.viminfo

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set bg=dark
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

nnoremap ; <Right>
nnoremap l <Up>
nnoremap k <Down>
nnoremap j <Left>
nnoremap h w
nnoremap w <C-w><C-w>

autocmd FileType java setlocal shiftwidth=3 tabstop=3
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType tex nnoremap <Down> gj
autocmd FileType tex nnoremap <Up> gk
autocmd FileType tex inoremap <Down> <C-o>gj
autocmd FileType tex inoremap <Up> <C-o>gk

set shellcmdflag=-ic

call pathogen#infect()
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_javascript_checkers = ['jslint']
