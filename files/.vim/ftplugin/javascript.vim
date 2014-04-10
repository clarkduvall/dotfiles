syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend

noremap <C-c> :s/^ */\0\/\/ /<cr>:noh<cr>

let g:syntastic_javascript_checkers = ['jslint']
