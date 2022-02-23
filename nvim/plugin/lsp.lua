local lsp_installer = require "nvim-lsp-installer"

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    -- Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)

    -- Format on save
    -- if client.name == 'tsserver' then client.resolved_capabilities.document_formatting = false end
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
        vim.api.nvim_command [[augroup END]]
    end
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lua_opts = {
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
}

local efm_opts = {
    init_options = {documentFormatting = true},
    filetypes = {"lua"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
                    formatStdin = true
                }
            }
        }
    }
}

local tsserver_opts = {}

local diagnosticls_opts = {
    filetypes = {'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc'},
    init_options = {
        linters = {
            eslint = {
                command = 'eslint_d',
                rootPatterns = {'package.json', '.eslintrc'},
                debounce = 100,
                args = {'--stdin', '--stdin-filename', '%filepath', '--format', 'json'},
                sourceName = 'eslint_d',
                parseJson = {
                    errorsRoot = '[0].messages',
                    line = 'line',
                    column = 'column',
                    endLine = 'endLine',
                    endColumn = 'endColumn',
                    message = '[eslint] ${message} [${ruleId}]',
                    security = 'severity'
                },
                securities = {[2] = 'error', [1] = 'warning'}
            }
        },
        filetypes = {javascript = 'eslint', javascriptreact = 'eslint', typescript = 'eslint', typescriptreact = 'eslint'},
        formatters = {
            eslint_d = {
                command = 'eslint_d',
                args = {'--stdin', '--stdin-filename', '%filename', '--fix-to-stdout'},
                rootPatterns = {'package.json', '.eslintrc'}
            },
            prettier = {
                command = 'prettier_d_slim',
                rootPatterns = {'package.json', '.prettierrc'},
                args = {'--stdin', '--stdin-filepath', '%filename'}
            }
        },
        formatFiletypes = {
            css = 'prettier',
            javascript = 'prettier',
            javascriptreact = 'prettier',
            scss = 'prettier',
            less = 'prettier',
            typescript = 'prettier',
            typescriptreact = 'prettier',
            json = 'prettier',
            markdown = 'prettier'
        }
    }

}

lsp_installer.on_server_ready(function(server)
    local opts = {on_attach = on_attach, capabilities = capabilities}
    if server.name == 'sumneko_lua' then opts = vim.tbl_deep_extend("force", lua_opts, opts) end
    if server.name == 'efm' then opts = vim.tbl_deep_extend("force", efm_opts, opts) end
    if server.name == 'tsserver' then opts = vim.tbl_deep_extend("force", tsserver_opts, opts) end
    if server.name == 'diagnosticls' then opts = vim.tbl_deep_extend("force", diagnosticls_opts, opts) end
    server:setup(opts)
end)

