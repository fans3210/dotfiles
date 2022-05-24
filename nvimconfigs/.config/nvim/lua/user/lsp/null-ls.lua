local null_ls  = require 'null-ls'
local handlers = require 'user.lsp.handlers'

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup {
    on_attach = handlers.on_attach,
    should_attach = function(bufnr)
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        local should = true
        if bufname:find('pwi-platform-gds', 1, true) then should = false end
        return should
    end,
    debug = true,
    sources = {
        formatting.prettierd.with {
        },
        formatting.black.with { extra_args = { "--fast" } },
        -- formatting.stylua,
        diagnostics.eslint_d
    }
}
