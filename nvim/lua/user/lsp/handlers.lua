local M = {}

function M.enable_format_on_save()
    vim.cmd [[
    augroup format_on_save
      autocmd! 
      autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync()
    augroup end
  ]]
    vim.notify "Enabled format on save"
end

function M.disable_format_on_save()
    M.remove_augroup "format_on_save"
    vim.notify "Disabled format on save"
end

function M.toggle_format_on_save()
    if vim.fn.exists "#format_on_save#BufWritePre" == 0 then
        M.enable_format_on_save()
    else
        M.disable_format_on_save()
    end
end

function M.remove_augroup(name)
    if vim.fn.exists("#" .. name) == 1 then
        vim.cmd("au! " .. name)
    end
end

M.on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Mappings.
    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)

    if client.name == 'tsserver' then
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end

    -- Format on save
    vim.cmd [[ command! LspToggleAutoFormat execute 'lua require("user.lsp.handlers").toggle_format_on_save()' ]]
    -- by default enable format on save
    require 'user.lsp.handlers'.enable_format_on_save()

    -- formatting command
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting_seq_sync()' ]]
    buf_set_keymap('n', '<leader>ff', ':Format<CR>', opts)

    -- document hightlight
    require 'illuminate'.on_attach(client)
end

-- Set up completion using nvim_cmp with LSP source
M.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

return M
