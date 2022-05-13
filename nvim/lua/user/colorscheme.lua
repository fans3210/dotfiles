vim.g.everforest_background = 'soft'
vim.g.everforest_diagnostic_virtual_text = 'colored'
vim.opt.background = 'dark';

local colorscheme = "everforest"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
