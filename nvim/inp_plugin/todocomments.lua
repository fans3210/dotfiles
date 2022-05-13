require'todo-comments'.setup {}

vim.api.nvim_set_keymap('n', '<leader>td', ':TodoTrouble<CR>', {noremap = true, silent = true})
