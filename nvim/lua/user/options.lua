local options = {
    clipboard = "unnamedplus",
    hlsearch = false,
    hidden = true,
    errorbells = false,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    nu = true,
    wrap = false,
    swapfile = false,
    backup = false,
    incsearch = true,
    ignorecase = true,
    smartcase = true,
    termguicolors = true,
    scrolloff = 8,
    cmdheight = 1,
    updatetime = 50,
    signcolumn = "yes",
    relativenumber = true
}

for k, v in pairs(options) do vim.opt[k] = v end
