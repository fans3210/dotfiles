require("bufferline").setup {
    options = {
        numbers = function(opts)
            return string.format('%s.', opts.ordinal)
        end,
        -- diagnostics = 'nvim_lsp',
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --     local s = " "
        --     for e, n in pairs(diagnostics_dict) do
        --         local sym = e == "error" and " " or (e == "warning" and " " or "")
        --         s = s .. n .. sym
        --     end
        --     return s
        -- end,
        separator_style = 'thick'
    }
    -- highlights = {buffer_selected = {guifg = 'black', guibg = 'white', gui = "bold,italic"}}
}

vim.cmd [[
nnoremap <silent><Tab> :BufferLineCycleNext<CR>
nnoremap <silent><S-Tab> :BufferLineCyclePrev<CR>

nnoremap <silent><C-l> :BufferLineMoveNext<CR>
nnoremap <silent><C-h> :BufferLineMovePrev<CR>

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
nnoremap <silent><leader>xx <Cmd>BufOnly<CR>
]]
