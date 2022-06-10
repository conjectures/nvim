
"~ ~ ~ MAPPINGS ~ ~ ~"
"Normal Mode
"reload vimrc file
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>
"open vimrc file for editing
nnoremap <leader>ev :e $MYVIMRC<CR>
"toggle between relative numbering
nnoremap <leader>r :call NumberToggle()<CR>
"buffer options
nnoremap <leader>bl :buffers<CR>:buffer<Space>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>b<leader> :b 

"remove search highlight
nnoremap <esc> :noh<return><esc>
"escape terminal with esc key
tnoremap <esc> <C-\><C-n>

"show leader key mappings
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

"Insert Mode
"autocomplete first suggestion with tab 
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
"inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() : "\<CR>"
"inoremap <expr> <C-y> pumvisible() ? asyncomplete#close_popup() : "\<C-y>"
"inoremap <expr> <C-e> pumvisible() ? asyncomplete#cancel_popup() : "\<C-e>"
""reload autocomplete list
"imap <c-space> <Plug>(asyncomplete_force_refresh)
"inoremap <expr> <C-j> ("\<C-n>")
"inoremap <expr> <C-k> ("\<C-p>")

"Visual Mode
vnoremap < <gv
vnoremap > >gv

"nvim-lsp
"others moved to lsp/settings.lua
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>d <cmd> lua vim.lsp.diagnostic.set_loclist()<CR>

"FZF
nmap <leader><tab> <plug>(fzf-maps-n)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)


"inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
"inoremap <expr> <c-x><c-f> fzf#vim#complete#path("find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'")




"nmap <silent>K <Plug>(lcn-hover)
"nmap <silent> gd <Plug>(lcn-definition)
"nmap <silent> <F2> <Plug>(lcn-rename)
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
"inoremap <c-c> <ESC>
"" When the <Enter> key is pressed while the popup menu is visible, it only
"" hides the menu. Use this mapping to close the menu and also start a new
"" line.
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
"" Use <TAB> to select the popup menu:
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

