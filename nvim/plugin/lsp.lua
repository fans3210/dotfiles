local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    -- Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)

    -- Format on save
    if client.name == 'tsserver' then client.resolved_capabilities.document_formatting = false end
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
        vim.api.nvim_command [[augroup END]]
    end
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- TypeScript
nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    filetypes = {"javascript", "typescript", "typescriptreact", "typescript.tsx"},
    capabilities = capabilities
}

nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
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

-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
USER = vim.fn.expand('$USER')

local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
    sumneko_root_path = "/Users/" .. USER .. "/.config/lua-language-server"
    sumneko_binary = "/Users/" .. USER .. "/.config/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
    sumneko_root_path = "/home/" .. USER .. "/.config/lua-language-server"
    sumneko_binary = "/home/" .. USER .. "/.config/lua-language-server/bin/Linux/lua-language-server"
else
    print("Unsupported system for sumneko")
end

nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
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

nvim_lsp.efm.setup {
    on_attach = on_attach,
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

-- python
nvim_lsp.pyright.setup {on_attach = on_attach, capabilities = capabilities}

-- golang
nvim_lsp.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {gopls = {analyses = {unusedparams = true, shadow = true}, staticcheck = true}}
}
