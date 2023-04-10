" key mappings
let mapleader = "\<Space>"
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>

" indent
set autoindent
set cindent

" tab sizes
set tabstop=4

" code completion
autocmd VimEnter * :COQnow

" vim/OS shared clipboard
set clipboard=unnamed
