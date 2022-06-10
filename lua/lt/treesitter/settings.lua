
-- TREESITTER --
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
-- local nvim_treesitter = require'nvim-treesitter.configs'

configs.setup {
    ensure_installed = {"typescript", "html", "tsx", "lua", "json", "css", "javascript", "python", "go", "cpp", "rst", "vue", "hcl"},
    sync_install = false,
    highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = true,
    },
    autopairs = {
        enable = true,
    },
    indent = { 
        enable = true,
        disable = {"python", "css"} 
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    autotag = {
        enable = true
    },
--    incremental_selection = {
--        enable = true,
--        keymaps = {
--            init_selection = "gnn",
--            node_incremental = "grn",
--            scope_incremental = "grc",
--            node_decremental = "grm",
--        },
--    },
}

-- parse terraform files with hashicorp lang parser
ft_to_parser.tf = "hcl" 
-- parser_config.html.used_by = "htmldjango"
