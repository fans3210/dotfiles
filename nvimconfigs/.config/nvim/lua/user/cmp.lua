local cmp = require 'cmp'

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then return end

cmp.setup({
    completeopt = 'menu, menuone, noselect',
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<C-e>'] = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close()}),
        ['<C-y>'] = cmp.mapping.confirm({select = true}),
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"})
    }),
    sources = cmp.config.sources({{name = 'nvim_lsp'}}, {{name = 'buffer'}}, {{name = 'luasnip'}}),
    formatting = {
        format = function(entry, vim_item)
            vim_item.menu =
                ({buffer = "[Buffer]", nvim_lsp = "[LSP]", luasnip = "[LuaSnip]", nvim_lua = "[Lua]", latex_symbols = "[Latex]"})[entry.source.name]
            return vim_item
        end
    }
})

vim.cmd [[highlight! default link CmpItemKind CmpItemMenuDefault]]
