-- NVIM - LSP --
local nvim_lsp = require('lspconfig')
local lsp_status = require('lsp-status')
local lsp_completion = require('completion')


local function custom_on_attach(client)
    lsp_status.on_attach(client)
    lsp_completion.on_attach(client)
     --require'completion'.on_attach()
 end

lsp_status.register_progress()
local default_lsp_config = {on_attach = custom_on_attach, capabilities = lsp_status.capabilities}

local servers = {
    html = {},
    pyls = {
      settings = {
        pyls = {
          plugins = {
            pycodestyle = {
              maxLineLength = 150
            },
            -- jedi_definition = {
            --     enabled = True,
            --     follow_imports = True,
            --     follow_builtin_imports = True,
            -- },
          }
        }
      },
    },
}
--nvim_lsp.diagnosticls.setup{on_attach=require'diagnostic'.on_attach}
-- nvim_lsp.tsserver.setup{}
--nvim_lsp.html.setup{}
-- nvim_lsp.bashls.setup{}
-- nvim_lsp.cssls.setup{}

-- nvim_lsp.pyls.setup {
--   on_attach = custom_on_attach,
--       settings = {
--         pyls = {
--           plugins = {
--             pycodestyle = {
--               maxLineLength = 150
--             },
--             -- jedi_definition = {
--             --     enabled = True,
--             --     follow_imports = True,
--             --     follow_builtin_imports = True,
--             -- },
--           }
--         }
--       },
-- }
for server, config in pairs(servers) do
    nvim_lsp[server].setup(vim.tbl_deep_extend("force", default_lsp_config, config))
end

local opts = { noremap=true }
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

-- TREESITTER --
-- local nvim_treesitter = require'nvim-treesitter.configs'
-- 
-- nvim_treesitter.setup {
-- ensure_installed = "maintained",
-- highlight = {
--     enable = true,
--     use_languagetree = true,
-- },
-- incremental_selection = {
--     enable = true,
--     keymaps = {
--         init_selection = "gnn",
--         node_incremental = "grn",
--         scope_incremental = "grc",
--         node_decremental = "grm",
--     }, },
-- }
-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.html.used_by = "htmldjango"
