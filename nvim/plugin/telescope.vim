nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

lua<<EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {

    mappings = {
      n = {
        ["q"] = actions.close
      },
      i = {
        ["<C-p>"] = false,
        ["<C-p>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  }
}
EOF
