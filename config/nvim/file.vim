"yaml
"set yaml-correct indentation
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"read .yaml.template files as .yaml
autocmd BufEnter *.yaml.template :setlocal filetype=yaml

"ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o

"temp files
set nobackup
set nowritebackup
set noswapfile

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
