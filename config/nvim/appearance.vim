syntax enable
syntax on
set background=dark
highlight VertSplit cterm=none gui=none
set hlsearch
set encoding=utf8
set scrolloff=8
let g:airline_theme='base16_snazzy'
" Show branch name in statusbar
let g:airline#extensions#branch#enabled = 1
" Allow gitgutter on files with many changes
let g:gitgutter_max_signs = 9999
