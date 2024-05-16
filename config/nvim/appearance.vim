syntax enable
syntax on
set background=dark
highlight VertSplit cterm=none gui=none
set hlsearch
set encoding=utf8
set scrolloff=8
" Allow gitgutter on files with many changes
let g:gitgutter_max_signs = 9999
" line numbers
set number
set relativenumber

" transparent background
highlight Normal guibg=none ctermbg=none
highlight NonText guibg=none ctermbg=none
