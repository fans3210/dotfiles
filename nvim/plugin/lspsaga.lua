local saga = require 'lspsaga'
saga.init_lsp_saga {error_sign = '', warn_sign = '', hint_sign = '', infor_sign = '', border_style = "round"}

-- lsp saga keymaps
vim.api.nvim_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-k>', [[<Cmd>Lspsaga signature_help<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gh', [[<Cmd>Lspsaga lsp_finder<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', ':Lspsaga diagnostic_jump_next<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':Lspsaga diagnostic_jump_prev<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>cd', ':Lspsaga show_line_diagnostics<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ca', ':Lspsaga code_action<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<leader>ca', ':Lspsaga range_code_action<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gr', ':Lspsaga rename<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gp', ':Lspsaga preview_definition<CR>', {noremap = true, silent = true})
