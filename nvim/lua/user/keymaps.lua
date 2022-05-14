local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

vim.g.mapleader = " "

-- general
keymap("n", "Q", "<nop>", opts)
keymap("n", "<leader><CR>", ":luafile %<CR>", opts)
keymap("i", "jk", "<Esc>", opts)

keymap("n", "<C-S>", ":update<cr>", opts)
keymap("i", "<C-S>", "<Esc>:update<cr>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
