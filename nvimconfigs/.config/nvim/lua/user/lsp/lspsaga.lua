local saga = require 'lspsaga'
saga.init_lsp_saga { error_sign = '', warn_sign = '', hint_sign = '', infor_sign = '', border_style = "round" }

-- lsp saga keymaps
vim.keymap.set('n', 'K', ':Lspsaga hover_doc<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-k>', [[<Cmd>Lspsaga signature_help<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', 'gh', [[<Cmd>Lspsaga lsp_finder<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', ']e', ':Lspsaga diagnostic_jump_next<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '[e', ':Lspsaga diagnostic_jump_prev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cd', ':Lspsaga show_line_diagnostics<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ca', ':Lspsaga code_action<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>ca', ':Lspsaga range_code_action<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', 'gr', ':Lspsaga rename<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gp', ':Lspsaga preview_definition<CR>', { noremap = true, silent = true })
-- scroll down hover doc or scroll in definition preview
-- nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
vim.keymap.set('n', '<C-f>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], { noremap = true, silent = true })
-- scroll up hover doc
-- nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
vim.keymap.set('n', '<C-b>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], { noremap = true, silent = true })
