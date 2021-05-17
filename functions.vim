
    "~ ~ ~ Functions ~ ~ ~"
        "Highlight trailing spaces and tabs function
if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list        "show problematic characters
highlight ExtraWhitespace ctermbg=grey
match ExtraWhitespace /\s\+$\|\t/ "match beginning or trailing whitespaces (reg expr.)
  

"Triggert relative numbering function
function! NumberToggle()
    if(&relativenumber ==1)
        set nornu
        set number
    else
        set rnu
    endif
endfunc


"Find buffer relative path from home or git dir
function! LightlineFilename()
    let root = fnamemodify(get(b:, 'git_dir'), ':h')
    let path = expand('%:p')
    if path[:len(root)-1] ==# root
        return path[len(root)+1:]
    endif
    return expand('%')
endfunc

function! LightlineTreesitter()
  return " "
  " return nvim_treesitter#statusline(90)
endfunc

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

"
" Terminal Function
let s:simple_terminal_window = -1
let s:simple_terminal_buffer = -1
let s:simple_terminal_job_id = -1

function! SimpleTerminalOpen()
  " Check if buffer exists, if not create a window and a buffer
  if !bufexists(s:simple_terminal_buffer)
    " Creates a window call simple_terminal
    new simple_terminal
    " Moves to the window the below the current one
    wincmd J
    let s:simple_terminal_job_id = termopen($SHELL, { 'detach': 1 })


     " Change the name of the buffer to "Terminal 1"
     silent file Terminal
     " Gets the id of the terminal window
     let s:simple_terminal_window = win_getid()
     let s:simple_terminal_buffer = bufnr('%')
     " Remove numbers
    " The buffer of the terminal won't appear in the list of the buffers
    " when calling :buffers command
    set nobuflisted
    " Resize 
  else
    if !win_gotoid(s:simple_terminal_window)
    sp
    " Moves to the window below the current one
    wincmd J
    buffer Terminal
     " Gets the id of the terminal window
     let s:simple_terminal_window = win_getid()
    endif
  endif
  set nonumber
  set norelativenumber
  set signcolumn=no
  exec "resize " . 12
  startinsert!
endfunction

function! SimpleTerminalToggle()
  if win_gotoid(s:simple_terminal_window)
    call SimpleTerminalClose()
  else
    call SimpleTerminalOpen()
  endif
endfunction

function! SimpleTerminalClose()
  if win_gotoid(s:simple_terminal_window)
    " close the current window
    hide
  endif
endfunction

function! SimpleTerminalExec(cmd)
  if !win_gotoid(s:simple_terminal_window)
    call SimpleTerminalOpen()
  endif

  " clear current input
  call jobsend(s:simple_terminal_job_id, "clear\n")

  " run cmd
  call jobsend(s:simple_terminal_job_id, a:cmd . "\n")
  normal! G
  wincmd p
endfunction

" With this maps you can now toggle the terminal
nnoremap <A-t> :call SimpleTerminalToggle()<cr>
tnoremap <A-t> <C-\><C-n>:call SimpleTerminalToggle()<cr>
"Refs
"https://gist.github.com/ram535/b1b7af6cd7769ec0481eb2eed549ea23
"https://www.reddit.com/r/vim/comments/8n5bzs/using_neovim_is_there_a_way_to_display_a_terminal/
"https://github.com/rafcamlet/nvim-whid
"
"
"
" This an example on how specify command with different types of files.
" augroup go
"     autocmd!
"     autocmd BufRead,BufNewFile *.go set filetype=go
"     autocmd FileType go nnoremap <F5> :call SimpleTerminalExec('go run ' . expand('%'))<cr>
" augroup END





"call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
"    \ 'name': 'buffer',
"    \ 'allowlist': ['*'],
"    \ 'blocklist': ['vim'],
"    \ 'completor': function('asyncomplete#sources#buffer#completor'),
"    \ 'config': {
"    \    'max_buffer_size': 5000000,
"    \  },
"    \ }))

"imap <expr> <Tab> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : pumvisible() ? "\<C-n>" : "\<Tab>"
"smap <expr> <Tab> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : pumvisible() ? "\<C-n>" : "\<Tab>"
"imap <expr> <S-Tab> vsnip#available(1) ? '<Plug>(vsnip-jump-prev)' : pumvisible() ? "\<C-p>" : "\<S-Tab>"
"smap <expr> <S-Tab> vsnip#available(1) ? '<Plug>(vsnip-jump-prev)' : pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() : "\<CR>"
"inoremap <expr> <C-y> pumvisible() ? asyncomplete#close_popup() : "\<C-y>"
"inoremap <expr> <C-e> pumvisible() ? asyncomplete#cancel_popup() : "\<C-e>"


"function! s:on_lsp_buffer_enabled() abort
"    setlocal omnifunc=lsp#complete
"    setlocal signcolumn=yes
"    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"    nmap <buffer> gd <plug>(lsp-definition)
"    nmap <buffer> gr <plug>(lsp-references)
"    nmap <buffer> gi <plug>(lsp-implementation)
"    nmap <buffer> <leader>rn <plug>(lsp-rename)
"    nmap <silent> [g <Plug>(lsp-previous-diagnostic)
"    nmap <silent> ]g <Plug>(lsp-next-diagnostic)
"    nmap <buffer> K <plug>(lsp-hover)
"
"    nnoremap <buffer> gs :<C-u>LspDocumentSymbol<CR>
"    nnoremap <buffer> gS :<C-u>LspWorkspaceSymbol<CR>
"    nnoremap <buffer> gQ :<C-u>LspDocumentFormat<CR>
"    vnoremap <buffer> gQ :LspDocumentRangeFormat<CR>
"    nnoremap <buffer> <leader>ca :LspCodeAction<CR>
"    xnoremap <buffer> <leader>ca :LspCodeAction<CR>
"    autocmd! BufWritePre *.rs,*.go,*.py call execute('LspDocumentFormatSync')
"endfunction
"
"augroup lsp_install
"    au!
"    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END


