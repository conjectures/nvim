
-- TREESITTER --
local nvim_treesitter = require'nvim-treesitter.configs'

nvim_treesitter.setup {
    ensure_installed = {"typescript", "html", "tsx", "lua", "json", "css", "javascript", "python", "go", "cpp", "rst", "vue"},
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.html.used_by = "htmldjango"
