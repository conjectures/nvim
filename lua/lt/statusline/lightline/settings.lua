
vim.g.lightline = {
    colorscheme = 'wombat',
    active = {
        left = {
            { 'mode', 'paste' },
            { 'gitbranch', 'readonly', 'filename', 'modified', 'treesitter' }
        },
        right = {
            {'lineinfo'},
            { 'fileformat', 'fileencoding', 'filetype' },
            { 'lsp_status' },
        },
    },
    component_function = {
        gitbranch = 'LightlineFugitive',
        filename = 'LightlineFilename',
        treesitter = 'LightlineTreesitter',
        filetype = 'LightlineFiletype',
    },
    component_expand = {
        lsp_status = 'LspStatus',
        buffers = 'lightline#bufferline#buffers',
    },
    component_visible_condition = {
        lsp_status = 'not vim.tbl_isempty(vim.lsp.buf_get_clients(0))',
    },
    component_type = {
        buffers = 'tabsel'
    },
    mode_map = {
        n = 'N',
        i = 'I',
        R = 'R',
        v = 'V',
        V = 'VL',
       ["<C-v>"]= 'VB',
       c = 'C',
       s = 'S',
       S = 'SL',
       ["<C-s>"] = 'SB',
       t= 'T',
    },
    subseparator = {
        -- left =  '\\uE0B1',
        -- right=  '\\uE0B3',
         left =  '|',
         right=  '|',
    },
    separator = {
        left = "",
        right = '',
    },
    tabline_separator = {
        left = ' ',
    },
    tabline = {
        left = {{'buffers'}},
        right = {}
    },
}

local result = vim.api.nvim_exec(
[[
function! LspStatus() abort
  if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
     return luaeval("require('lsp-status').status()")
  else
      return ''
  endif
endfunction

function! LightlineFugitive()
    let _ = FugitiveHead()
    return strlen(_) ? ' '._ : ''
endfunction

]],
true)

-- let g:lightline#bufferline#show_number  = 1
-- let g:lightline#bufferline#shorten_path = 0
-- let g:lightline#bufferline#unnamed      = '[No Name]'
-- let g:lightline = {
--     \   'colorscheme': 'wombat',
--     \   'active': {
--     \     'left': [ [ 'mode', 'paste' ],
--     \               [ 'gitbranch', 'readonly', 'filename', 'icon', 'modified','treesitter' ] ]
--     \ },
--     \   'component_function': {
--     \     'filename': 'LightlineFilename',
--     \     'gitbranch': 'FugitiveHead',
--     \     'treesitter': 'LightlineTreesitter',
--     \     'filetype': 'LightlineFiletype',
--     \ },
--     \ }
-- 
-- let g:lightline.tabline          = {'left': [['buffers']], 'right': []}
-- let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
-- let g:lightline.component_type   = {'buffers': 'tabsel'}
-- "let g:lightline.separator = { 'left': '\uE0B0', 'right': '\uE0b2'}
-- let g:lightline.separator = { 'left': "", 'right': "" }
-- let g:lightline.subseparator = { 'left': '\uE0B1', 'right': '\uE0b3'}
