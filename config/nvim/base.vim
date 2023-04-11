" Key maps
let mapleader = "\<Space>"
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>

" Indentation
set autoindent
set cindent

" Tab sizes
set tabstop=4

" Code completion
autocmd VimEnter * :COQnow

" Vim/OS shared clipboard
set clipboard=unnamed
