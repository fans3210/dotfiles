require("bufferline").setup {
    options = {
        numbers = function(opts)
            return string.format('%s.', opts.ordinal)
        end,
        separator_style = 'thick'
    }
    -- highlights = {buffer_selected = {guifg = 'black', guibg = 'white', gui = "bold,italic"}}
}

vim.cmd [[
nnoremap <silent><TAB> :BufferLineCycleNext<CR>
nnoremap <silent><S-TAB> :BufferLineCyclePrev<CR>
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>


nnoremap <silent><leader>xh <Cmd>BufferLineCloseLeft<CR>
nnoremap <silent><leader>xl <Cmd>BufferLineCloseRight<CR>
nnoremap <silent><leader>xp <Cmd>BufferLinePickClose<CR>
]]
