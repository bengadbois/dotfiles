"plugins
call plug#begin('~/.vim/plugged')

"git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"language/file
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'sheerun/vim-polyglot'
"visual
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim', { 'as': 'dracula' }
"formatting
Plug 'tpope/vim-sleuth'
"misc
Plug 'spolu/dwm.vim'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

"visual
syntax enable
syntax on
set background=dark
silent! color dracula "if started before plugins installed this would throw an error
highlight VertSplit cterm=none gui=none
set hlsearch
set encoding=utf8
let g:airline_theme='dracula'
let g:airline#extensions#branch#enabled = 1 "show branch name in statusbar

"searching
set ignorecase "case insensitive
set smartcase  "use case if any caps used 
set incsearch  "show match as search proceeds

"indent
set autoindent
set cindent

"folding
set foldmethod=indent "fold based on indent
set foldnestmax=10    "deepest fold is 10 levels
set nofoldenable      "dont fold by default
set foldlevel=1

"ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o

"~files
set nobackup
set nowritebackup
set noswapfile

"tab sizes
set tabstop=4

"go
let g:go_fmt_command = "goimports"

"vimdiff
set diffopt+=iwhite "ignore whitespace

" Protect large files from sourcing and other overhead.
" Files become read only
if !exists("my_auto_commands_loaded")
  let my_auto_commands_loaded = 1
  " Large files are > 50M
  " Set options:
  " eventignore+=FileType (no syntax highlighting etc
  " assumes FileType always on)
  " noswapfile (save copy of file)
  " bufhidden=unload (save memory when other file is viewed)
  " buftype=nowritefile (is read-only)
  " undolevels=-1 (no undo possible)
  let g:LargeFile = 1024 * 1024 * 50
  augroup LargeFile
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
  augroup END
endif

"key mappings
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>
