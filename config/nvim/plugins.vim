call plug#begin('~/.vim/plugged')

" Language/file
Plug 'neovim/nvim-lspconfig' " lsp client
Plug 'ms-jpq/coq_nvim', { 'do': ':COQdeps' } " code completion
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " smart highlighting
Plug 'dense-analysis/ale' " linting
Plug 'sheerun/vim-polyglot' " multi language pack
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' } " golang
Plug 'ntpeters/vim-better-whitespace' " trailing whitespace
Plug 'AndrewRadev/linediff.vim' " diff within same file
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['json', 'markdown', 'yaml', 'html'] }

" Appearance
Plug 'nvim-lualine/lualine.nvim' " statusline
Plug 'tpope/vim-sleuth' " smart tabbing
Plug 'nvim-tree/nvim-web-devicons' " optional dependency for oil and telescope

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fzf
Plug 'junegunn/fzf.vim' " fzf
Plug 'nvim-lua/plenary.nvim' " dependency for telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' } " telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " faster telescope search
Plug 'stevearc/aerial.nvim' " navigation
Plug 'nvim-lua/popup.nvim' " dependency for telescope-zoxide
Plug 'jvgrootveld/telescope-zoxide' " dir navigation
Plug 'stevearc/oil.nvim' " file explorer

" Git
Plug 'airblade/vim-gitgutter' " git status
Plug 'tpope/vim-fugitive' " git commands
Plug 'tpope/vim-rhubarb' " github integration

" Other
" Plug 'spolu/dwm.vim' " tiling
Plug 'tpope/vim-commentary' " commenting
Plug 'folke/which-key.nvim' " keybinding help

call plug#end()


exec 'luafile' expand(g:custom_path . 'lua/treesitter.lua')
exec 'luafile' expand(g:custom_path . 'lua/telescope.lua')
exec 'luafile' expand(g:custom_path . 'lua/aerial.lua')
exec 'luafile' expand(g:custom_path . 'lua/lualine.lua')
exec 'luafile' expand(g:custom_path . 'lua/which-key.lua')
exec 'luafile' expand(g:custom_path . 'lua/oil.lua')
