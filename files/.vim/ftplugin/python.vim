setlocal shiftwidth=4
setlocal tabstop=4
setlocal foldmethod=indent

noremap <C-c> :s/^ */\0# /<cr>:noh<cr>

let g:syntastic_python_checkers = ['flake8']