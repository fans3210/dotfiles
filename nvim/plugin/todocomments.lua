require'todo-comments'.setup {}

vim.api.nvim_set_keymap('n', '<leader>td', ':TodoTelescope<CR>', {noremap = true, silent = true})
