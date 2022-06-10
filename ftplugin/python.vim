
"syntax off
"    autocmd VimEnter * echo 'helloworld'
"    inoremap { {}<esc>i

"Enable Lsp support
"if executable('pyls')
"    " pip install python-language-server
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'pyls',
"        \ 'cmd': {server_info->['pyls']},
"        \ 'allowlist': ['python'],
"        \ })
"endif
"
" DISABLE RUNTIME MAPPINGS:
let no_python_maps = 1
