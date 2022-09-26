"plugins
call plug#begin('~/.vim/plugged')

" language/file
Plug 'neovim/nvim-lspconfig' " lsp client
Plug 'ms-jpq/coq_nvim', { 'do': ':COQdeps' } " code completion
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " smart highlighting
Plug 'dense-analysis/ale' " linting
Plug 'sheerun/vim-polyglot' " multi language pack
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' } " golang

" appearance
Plug 'vim-airline/vim-airline' " statusline
Plug 'vim-airline/vim-airline-themes' " statusline theme
Plug 'tpope/vim-sleuth' " smart tabbing

" search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fzf
Plug 'junegunn/fzf.vim' " fzf
Plug 'mileszs/ack.vim' " ripgrep

" git
Plug 'airblade/vim-gitgutter' " git status
Plug 'tpope/vim-fugitive' " git commands
Plug 'tpope/vim-rhubarb' " github integration

" other
Plug 'spolu/dwm.vim' " tiling
Plug 'tpope/vim-commentary' " commenting
Plug 'nanotee/zoxide.vim' " dir navigation

call plug#end()


exec 'luafile' expand(g:custom_path . 'lua/treesitter.lua')
