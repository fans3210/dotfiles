local M = {}
M.search_dotfiles = function()
    require('telescope.builtin').find_files({ prompt_title = "< Dotfiles >", cwd = "$HOME/dotfiles", hidden = true })
end

return M
