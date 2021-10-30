local actions = require 'telescope.actions'

require('telescope').setup {
    defaults = {
        file_ignore_patterns = {"node_modules", "package%-lock.json"},
        mappings = {
            n = {["q"] = actions.close},
            i = {
                ["<C-p>"] = actions.close,
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-x>"] = actions.delete_buffer
            }
        },
        extensions = {fzf = {override_generic_sort = false, override_file_sorter = true, case_mode = "smart_case"}}
    }
}
require('telescope').load_extension('fzf')

vim.api.nvim_set_keymap('n', '<c-p>', [[<cmd>lua require'telescope.builtin'.find_files()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ';r', [[<cmd>lua require'telescope.builtin'.live_grep()<CR>]], {noremap = true, silent = true})

-- double slash(escaped)
vim.api.nvim_set_keymap('n', '\\\\', [[<cmd>Telescope buffers<CR>]], {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', ';;', [[<cmd>Telescope help_tags<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fc', [[<cmd>lua require'telescope.builtin'.quickfix()<CR>]], {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>vrc', [[<cmd>lua require'theprimeagen.telescope'.search_dotfiles()<CR>]], {noremap = true, silent = true})
