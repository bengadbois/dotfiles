syntax enable
syntax on
set background=dark
highlight VertSplit cterm=none gui=none
set hlsearch
set encoding=utf8
let g:airline_theme='base16_snazzy'
let g:airline#extensions#branch#enabled = 1 "show branch name in statusbar
let g:gitgutter_max_signs = 9999  "allow gitgutter on files with many changes
