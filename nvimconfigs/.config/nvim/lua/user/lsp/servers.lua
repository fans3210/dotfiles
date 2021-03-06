local handlers = require 'user.lsp.handlers'
local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'

local opts = { on_attach = handlers.on_attach, capabilities = handlers.capabilities }

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
lua_opts = vim.tbl_deep_extend('force', lua_opts, opts)
lspconfig.sumneko_lua.setup(lua_opts)

local tsserver_opts = {}
tsserver_opts = vim.tbl_deep_extend('force', tsserver_opts, opts)
lspconfig.tsserver.setup(tsserver_opts)

local pyright_opts = {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
            },
        },
    },
}
pyright_opts = vim.tbl_deep_extend('force', pyright_opts, opts)
lspconfig.pyright.setup(pyright_opts)

-- local gopls_opts = { settings = { gopls = { analyses = { unusedparams = true, shadow = true }, staticcheck = true } } }
local gopls_opts = {
    cmd = { "gopls", "serve" },
    filetypes = { "go", "gomod" },
    root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}
gopls_opts = vim.tbl_deep_extend('force', gopls_opts, opts)
lspconfig.gopls.setup(gopls_opts)


-- golang lint
if not configs.golangcilsp then
    configs.golangcilsp = {
        default_config = {
            cmd = { 'golangci-lint-langserver' },
            root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
            init_options = {
                command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json" };
            }
        };
    }
end
lspconfig.golangci_lint_ls.setup {
    filetypes = { 'go', 'gomod' }
}


local bashls_opts = {}
bashls_opts = vim.tbl_deep_extend('force', bashls_opts, opts)
lspconfig.bashls.setup(bashls_opts)

local cssls_opts = {}
cssls_opts = vim.tbl_deep_extend('force', cssls_opts, opts)
lspconfig.cssls.setup(cssls_opts)

local cssmodules_ls_opts = {}
cssmodules_ls_opts = vim.tbl_deep_extend('force', cssmodules_ls_opts, opts)
lspconfig.cssmodules_ls.setup(cssmodules_ls_opts)
