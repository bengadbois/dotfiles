"plugins
call plug#begin('~/.vim/plugged')

"git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
"language/file
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'sheerun/vim-polyglot'
"visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"formatting
Plug 'tpope/vim-sleuth'
"misc
Plug 'spolu/dwm.vim'
" Plug 'w0rp/ale' was causing extra gopls's to spin up
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

call plug#end()

"visual
syntax enable
syntax on
set background=dark
highlight VertSplit cterm=none gui=none
set hlsearch
set encoding=utf8
let g:airline_theme='base16_snazzy'
let g:airline#extensions#branch#enabled = 1 "show branch name in statusbar
let g:gitgutter_max_signs = 9999  "allow gitgutter on files with many changes

"key mappings
let mapleader = "\<Space>"
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>

"searching
set ignorecase "case insensitive
set smartcase  "use case if any caps used 
set incsearch  "show match as search proceeds

"taken from https://www.freecodecamp.org/news/how-to-search-project-wide-vim-ripgrep-ack/
" Use ripgrep for ack
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'
" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1
" Don't jump to first match
cnoreabbrev Ack Ack!
" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>

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

"temp files
set nobackup
set nowritebackup
set noswapfile

"tab sizes
set tabstop=4

"yaml
"set yaml-correct indentation
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"go
let g:go_fmt_command = "goimports"

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <silent> <c-b> :<C-u>call <SID>build_go_files()<CR>

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
