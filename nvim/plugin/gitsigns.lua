require'gitsigns'.setup {
    signs = {
        add = {hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn'},
        change = {hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn'},
        delete = {hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn'},
        topdelete = {hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn'}
    },
    keymaps = {
        noremap = true,
        ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>'
    }
}
