vim.g.everforest_background = 'soft'
vim.g.everforest_diagnostic_virtual_text = 'colored'
-- vim.g.gruvbox_material_palette = 'material'

-- vim.g.gruvbox_material_background = 'medium' -- hard, medium, soft
vim.g.everforest_background = 'soft'

vim.opt.background = 'dark'
local colorscheme = "everforest"
-- local colorscheme = 'gruvbox'
-- local colorscheme = 'gruvbox-material'
-- local colorscheme = 'serenade'

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
