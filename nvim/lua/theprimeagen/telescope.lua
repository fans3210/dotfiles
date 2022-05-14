local M = {}
M.search_dotfiles = function()
    require('telescope.builtin').find_files({prompt_title = "< Dotfiles >", cwd = "$HOME/.config/dotfiles"})
end

return M
