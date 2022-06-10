"setlocal syntax=None
setlocal shiftwidth=2 softtabstop=2 expandtab

augroup html
  autocmd!
augroup END
autocmd html VimEnter * echo &syntax

"patch - find how to fix
"setlocal TSBufEnable highlight
"highlight Normal ctermbg=None
"highlight SignColumn ctermbg=None               "remove background from 'gutter'"

"set shiftwidth=2 
"set softtabstop=2 
"set expandtab 

