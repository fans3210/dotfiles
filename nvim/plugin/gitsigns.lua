require'gitsigns'.setup {
    keymaps = {
        noremap = true,
        ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>'
    }
}
