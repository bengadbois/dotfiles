" Case sensitive only when an upper-case letter used
set ignorecase smartcase
" Show match as search proceeds
set incsearch
" Clear the search buffer when hitting ctrl+c
:nnoremap <C-c> :nohlsearch<cr>

" Telescope keymaps
nnoremap <Leader>/ <cmd>Telescope live_grep<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Zoxide
nnoremap <leader>fz :Z<space>

" Aerial keymaps
nnoremap <leader>a <cmd>AerialToggle!<cr>
