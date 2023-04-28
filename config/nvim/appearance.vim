" Syntax
syntax enable
syntax on

highlight VertSplit cterm=none gui=none

" Lines
set scrolloff=8

" Colors
" colorscheme catppuccin-latte
" colorscheme catppuccin-frappe
colorscheme catppuccin-macchiato
" colorscheme catppuccin-mocha

let g:airline_theme = 'catppuccin'
" Show branch name in statusbar
let g:airline#extensions#branch#enabled = 1

" Gitgutter
let g:gitgutter_max_signs = 9999 " Allow gitgutter on files with many changes

" Misc
set encoding=utf8
