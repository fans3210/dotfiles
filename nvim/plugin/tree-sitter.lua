require'nvim-treesitter.configs'.setup {
    highlight = {enable = true, disable = {}},
    indent = {enable = false, disable = {}},
    ensure_installed = {"tsx", "json", "yaml", "html", "scss", "python", "javascript", "typescript", "lua", "java"},
    context_commentstring = {enable = true}
}
local parser_config = require"nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = {"javascript", "typescript.tsx"}
