
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
  return nvim_treesitter#statusline(90)
endfunc

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction


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


