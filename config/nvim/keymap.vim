" Clear the search buffer when hitting ctrl+c
nnoremap <C-c> :nohlsearch<cr>

" Telescope keymaps
nnoremap <Leader>/ <cmd>Telescope live_grep<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fd <cmd>Telescope zoxide list<cr>

" Aerial keymaps
nnoremap <leader>a <cmd>AerialToggle!<cr>

" Oil keymap
nnoremap - <cmd>Oil<cr>

" fugitive keymap
nnoremap <leader>g <cmd>call feedkeys(':Git ')<cr>

" buffer switching
nnoremap <tab> <cmd>:bnext<cr>
nnoremap <s-tab> <cmd>:bprev<cr>
