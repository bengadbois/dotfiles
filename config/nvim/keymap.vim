" set leader
let mapleader = "\<Space>"

let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

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
nnoremap <leader>gb <cmd>GBrowse<cr>
" line range select in visual mode
xnoremap <leader>gb :'<'>GBrowse<cr>

" buffer switching
nnoremap <tab> <cmd>:bnext<cr>
nnoremap <s-tab> <cmd>:bprev<cr>
nnoremap <leader>bd <cmd>:bd<cr>

" LSP
nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <leader>rr <cmd>lua vim.lsp.buf.rename()<cr>
