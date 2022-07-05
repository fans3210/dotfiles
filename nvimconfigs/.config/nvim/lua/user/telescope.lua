local actions = require 'telescope.actions'
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

require('telescope').setup {
    defaults = {
        layout_config = {
            horizontal = {
                width = 0.95,
                height = 0.95,
            },
        },
        file_ignore_patterns = { ".git/", "node_modules", "package%-lock.json" },
        mappings = {
            n = { ["q"] = actions.close },
            i = {
                ["<C-c>"] = actions.close,
                ["<C-q>"] = actions.send_to_qflist
                -- ["<C-j>"] = actions.move_selection_next,
                -- ["<C-k>"] = actions.move_selection_previous,
                -- ["<C-x>"] = actions.delete_buffer
            }
        },
        extensions = { fzf = { override_generic_sort = false, override_file_sorter = true, case_mode = "smart_case" } }
    }
}
require('telescope').load_extension('fzf')

keymap('n', '<c-p>', [[<cmd>lua require'telescope.builtin'.find_files()<CR>]], opts)
keymap('n', '<leader>r', [[<cmd>lua require'telescope.builtin'.live_grep()<CR>]], opts)

-- double slash(escaped)
keymap('n', '\\\\', [[<cmd>Telescope buffers<CR>]], opts)

-- keymap('n', '<leader>fh', [[<cmd>Telescope help_tags<CR>]], opts)

keymap('n', '<leader>vrc', [[<cmd>lua require'theprimeagen.telescope'.search_dotfiles()<CR>]], opts)
keymap('n', '<leader>fh', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", opts)
