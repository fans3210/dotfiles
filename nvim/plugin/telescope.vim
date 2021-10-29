nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').quickfix()<cr>

nnoremap <leader>vrc :lua require("theprimeagen.telescope").search_dotfiles()<cr>

lua<<EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules", "package%-lock.json" },
    mappings = {
      n = {
        ["q"] = actions.close
      },
      i = {
        ["<C-p>"] = false,
        ["<C-p>"] = actions.close,
        ["<C-q>"] = actions.send_to_qflist,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-x>"] = actions.delete_buffer,
      },
    },
    extensions = {
        fzf = {
            override_generic_sort = false,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
  }
}
require('telescope').load_extension('fzf')
EOF
