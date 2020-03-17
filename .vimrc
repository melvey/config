syntax on
set shiftwidth=2
set tabstop=2
set noexpandtab
set number
set ff=unix
set term=builtin_ansi
set wildmode=longest:full,full
au BufNewFile,BufRead *.ejs set filetype=html

set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y

execute pathogen#infect()
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_html_tidy_exec = 'tidy'
let g:syntastic_pug_checkers = ['pug_lint']
let g:syntastic_sass_checkers = ["sasslint"]
let g:syntastic_scss_checkers = ["sasslint"]
let g:syntastic_typescript_tsc_fname = ''

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

filetype plugin indent on

set tags=./tags,tags
filetype plugin on

set statusline+=%=%c,%l/%L\ %P
