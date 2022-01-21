require'trouble'.setup {
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"l"}, -- jump to the diagnostic or open / close folds
        open_split = {}, -- open buffer in new split
        open_vsplit = {}, -- open buffer in new vsplit
        open_tab = {}, -- open buffer in new tab
        jump_close = {}, -- jump to the diagnostic and close the list
        toggle_mode = {}, -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {}, -- open all folds
        toggle_fold = {}, -- toggle fold of current file
        previous = "k", -- preview item
        next = "j" -- next item
    }
}

vim.api.nvim_set_keymap("n", "<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>tq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
