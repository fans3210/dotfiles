local lsp_installer = require "nvim-lsp-installer"
local null_ls = require "null-ls"

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Mappings.
    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)

    -- Format on save
    if client.name == 'tsserver' then client.resolved_capabilities.document_formatting = false end
    -- if client.name == 'diagnosticls' then client.resolved_capabilities.document_formatting = false end

    if client.resolved_capabilities.document_formatting then
        vim.cmd [[
            augroup Format
                autocmd!
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
            augroup END
        ]]
    end
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lua_opts = {
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' }
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true }
            }
        }
    }
}

local tsserver_opts = {}
local pyright_opts = {}
local gopls_opts = { settings = { gopls = { analyses = { unusedparams = true, shadow = true }, staticcheck = true } } }

lsp_installer.on_server_ready(function(server)
    local opts = { on_attach = on_attach, capabilities = capabilities }
    if server.name == 'sumneko_lua' then opts = vim.tbl_deep_extend("force", lua_opts, opts) end
    if server.name == 'tsserver' then opts = vim.tbl_deep_extend("force", tsserver_opts, opts) end
    if server.name == 'pyright' then opts = vim.tbl_deep_extend("force", pyright_opts, opts) end
    if server.name == 'gopls' then opts = vim.tbl_deep_extend("force", gopls_opts, opts) end
    server:setup(opts)
end)

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup {
    on_attach = on_attach,
    debug = false,
    sources = {
        formatting.prettier.with {
            extra_filetypes = { "toml", "solidity" },
            extra_args = { "--single-quote", "--jsx-single-quote" }
        },
        formatting.black.with { extra_args = { "--fast" } }, formatting.stylua,
        diagnostics.eslint,
    }
}
