"Configuration file for neovim
"   File: ~/.config/nvim/init.vim "   Author: Alex "   Created: 10.10.18

"echom "HELLO WORLD"
"
"~ ~ ~ PLUGINS ~ ~ ~" 
call plug#begin('~/.config/nvim/plugged')

"Theme
 Plug 'lifepillar/vim-gruvbox8'
"Plug 'arcticicestudio/nord-vim'
"let g:nord_uniform_diff_background = 1
Plug 'ryanoasis/vim-devicons'

"Interface
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'liuchengxu/vim-which-key'                                        "Super key cheat sheet
"Plug 'liuchengxu/vim-which-key', { 'on' : ['WhichKey', 'WhichKey!'] }   "Lazy load
Plug '~/.config/fzf'                                                    "fzf installation and vim wrapper
Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }                 "fzf vim integration
Plug 'BurntSushi/ripgrep'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'psliwka/vim-smoothie'                                             "Smooth scrolling
"Plug 'mcchrish/nnn.vim'                                                "nnn as vim file explorer
Plug 'christoomey/vim-system-copy'                                      "copy/paste to clipboard with `cp`
"Git
Plug 'tpope/vim-fugitive'                                               "Git integration plugin
Plug 'tpope/vim-rhubarb'


"IDE
"Formatting
Plug 'tpope/vim-surround'                                               "Brackets
Plug 'alvan/vim-closetag'
"Plug 'lambdalisue/vim-backslash', { 'filetype': 'vim' }                 "Add backlash on vimscript newlines
Plug 'jiangmiao/auto-pairs'                                             "Auto complete brackets
Plug 'mattn/emmet-vim', {'for': 'html'}                                 "html,css shortcuts
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }               "Treeview file explorer plugin"
Plug 'kristijanhusak/defx-git'                                          "Git integration"
Plug 'kristijanhusak/defx-icons'


"LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'                                         "async completion framework in lua
Plug 'nvim-lua/diagnostic-nvim'                                         "wrapper for neovim built in lsp diagnosis config
Plug 'nvim-lua/lsp-status.nvim'
"Plug 'tjdevries/nlua.nvim'                                             "lua development for lua
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/deoplete-lsp'

"Syntax
"Plug 'sheerun/vim-polyglot'                                             "Additional syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}

"
"
call plug#end()

"Source vim files
let g:vim_home = get(g:, 'vim_home', expand('~/.config/nvim/'))
let config_list = [
      \ 'plugset.vim',
      \ 'functions.vim',
      \ 'config.vim',
      \ 'keymaps.vim',
      \]

for files in config_list
    "echo g:vim_home.files
    for f in glob(g:vim_home.files, 1, 1)
        exec 'source' f
    endfor
endfor


"~ ~ ~ Plugin Settings ~ ~ ~"
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:AutoPairsFlyMode = 0
"let g:vimsyn_embed = '1'



" Source lua plugin configs
 if &runtimepath =~? 'nvim-lsp'
   lua require 'lt.lsp'
 endif
 lua require 'lt.which-key.settings'
 lua require 'lt.statusline.lightline'
 lua require 'lt.treesitter'
 "lua require 'lt.which-key.remap'


"command Declaration :lua vim.lsp.buf.declaration(
"command Definition :lua vim.lsp.buf.definition()
"command Hover :lua vim.lsp.buf.hover()
"command Implementation :lua vim.lsp.buf.implementation()
"command SignatureHelp :lua vim.lsp.buf.signature_help()
"command TypeDefinition :lua vim.lsp.buf.type_definition()
"command References :lua vim.lsp.buf.references()
"command DocumentSymbol :lua vim.lsp.buf.document_symbol()
"command WorkspaceSymbol :lua vim.lsp.buf.workspace_symbol()
"command Format :lua vim.lsp.buf.formatting_sync(nil, 1000)
lua << EOF
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {
        spacing = 10,
      },
      signs = true,
      underline=false,
      }
    )
EOF

sign define LspDiagnosticsSignError text=✖
sign define LspDiagnosticsSignWarning text=⚠
sign define LspDiagnosticsSignInformation text=ℹ
" sign define LspDiagnosticsHintSign text=➤
" call sign_define("LspDiagnosticsErrorSign", {"text" : "✗", "texthl" : "LspDiagnosticsError"})
" call sign_define("LspDiagnosticsErrorSign", {"text" : "✗", "texthl" : "LspDiagnosticsError"})
" call sign_define("LspDiagnosticsWarningSign", {"text" : "~", "texthl" : "LspDiagnosticsWarning"})
highlight LspDiagnosticsDefaultError ctermfg=Red cterm=bold,italic
highlight LspDiagnosticsDefaultWarning ctermfg=Yellow
highlight LspDiagnosticsVirtualTextWarning ctermfg=243 cterm=italic

" let g:diagnostic_insert_delay = 1
" let g:diagnostic_enable_virtual_text = 0

    
" ----- vim close-tag
let g:closetag_filenames = '*.html,*.xhtml,,*jsx,*js,*tsx'
let g:closetag_xhtml_filenames = '*.xml,*.xhtml,,*jsx,*js,*tsx'
let g:closetag_filetypes = '.html,.xhtml,,jsx,js,tsx'
let g:closetag_xhtml_filetypes = '.html,.xhtml,,jsx,js,tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

"Python path
"let g:python_host_prog = '$HOME/.pyenv/versions/neovim2/bin/python'
"let g:python3_host_prog = '$HOME/.pyenv/versions/neovim3/bin/python'


    "~ ~ ~ Autocommands ~ ~ ~"
augroup completion
  autocmd!
  autocmd BufEnter * lua require'completion'.on_attach()
augroup END

augroup vimrc
  autocmd!
  autocmd FileType html EmmetInstall
  "Automatically set read-only for files being edited elsewhere
  autocmd SwapExists * nested let v:swapchoice = 'o'
augroup END

"set relative numbering on normal mode and normal numnbers on insert. Also
"check if defx window before toggling
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * if &filetype != 'defx' | set relativenumber | endif
  autocmd BufLeave,FocusLost,InsertEnter * if &filetype != 'defx'| set nornu nu | endif
augroup END

"Highligh flash when text is yanked. Uses native lua module vim.higlight 
augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

"Remove statusline from fzf window
"augroup fzfgroup
"  autocmd!
"augroup END
"if has('nvim') && !exists('g:fzf_layout')
"  autocmd! fzfgroup FileType fzf
"  autocmd fzfgroup FileType fzf set laststatus=0 noshowmode noruler
"    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
"endif


"remove background (for transparency)
highlight Normal ctermbg=None
"remove background from 'gutter'"
highlight SignColumn ctermbg=None
highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=None gui=NONE guifg=#93a1a1 guibg=#002931

" augroup neovim_terminal
"     autocmd!
"     " Enter Terminal-mode (insert) automatically
"     autocmd TermOpen * startinsert
"     " Disables number lines on terminal buffers
"     autocmd TermOpen * :set nonumber norelativenumber
"     " allows you to use Ctrl-c on terminal window
"     autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
" augroup END
"let g:diagnostic_show_sign = 1
"sign define LspDiagnos
" Terminal Function
" let g:term_buf = 0
" let g:term_win = 0
" function! TermToggle(height)
"     if win_gotoid(g:term_win)
"         hide
"     else
"         botright new
"         exec "resize " . a:height
"         try
"             exec "buffer " . g:term_buf
"         catch
"             call termopen($SHELL, {"detach": 0})
"             let g:term_buf = bufnr("")
"             set nonumber
"             set norelativenumber
"             set signcolumn=no
"         endtry
"         startinsert!
"         let g:term_win = win_getid()
"     endif
" endfunction
" 
" nnoremap <A-t> :call TermToggle(12)<CR>
" inoremap <A-t> <Esc>:call TermToggle(12)<CR>
" tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>
" tnoremap <Esc> <C-\><C-n>
" tnoremap :q! <C-\><C-n>:q!<CR>
" lua << EOF
"     vim.api.nvim_get_current_win()
" EOF
"
"command! NLterm lua require('other.test'.test())
"
" let buf = nvim_create_buf(v:false, v:true)
" call nvim_buf_set_lines(buf, 0, -1, v:true, ["test", "text"])
" let opts = {'relative': 'cursor', 'width': 10, 'height': 2, 'col': 0,
"     \ 'row': 1, 'anchor': 'NW', 'style': 'minimal'}
" let win = nvim_open_win(buf, 0, opts)
" " optional: change highlight, otherwise Pmenu is used
" call nvim_win_set_option(win, 'winhl', 'Normal:MyHighlight')
"
"
"References (open with gx)
"https://github.com/zzzeyez/dots/tree/master/nvim
"https://github.com/22mahmoud/neovim
"https://github.com/tjdevries/config_manager/tree/master/xdg_config/nvim
"https://github.com/lucax88x/configs/tree/master/dotfiles/.config/nvim

