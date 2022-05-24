local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end
    }
}

return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"

    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require 'user.colorizer'
        end
    }

    use {
        'akinsho/bufferline.nvim',
        -- tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require 'user.bufferline'

        end
    }
    use { "numtostr/BufOnly.nvim", cmd = "BufOnly" }

    -- alternative colorscheme
    use 'sainnhe/everforest'
    use { "ellisonleao/gruvbox.nvim" }
    use 'sainnhe/gruvbox-material'
    use 'b4skyx/serenade'

    -- use {
    --     'neovim/nvim-lspconfig',
    --     config = function()
    --         require 'user.lsp'
    --     end
    -- }
    use {
        'williamboman/nvim-lsp-installer',
        {
            'neovim/nvim-lspconfig',
            config = function()
                require 'user.lsp.installer'
                require 'user.lsp.servers'
            end
        }
    }
    use {
        'tami5/lspsaga.nvim',
        config = function()
            require 'user.lsp.lspsaga'
        end
    }

    use {
        'filipdutescu/renamer.nvim',
        branch = 'master',
        config = function()
            require 'user.renamer'
        end
    }

    use {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require 'user.lsp.null-ls'
        end
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require 'user.tree-sitter'
        end
    }
    -- completion
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require 'user.cmp'
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        config = function()
            require 'user.telescope'
        end
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require 'user.lualine'
        end
    }

    use {
        'windwp/nvim-autopairs',
        config = function()
            require 'user.autopairs'
        end
    }
    use { 'windwp/nvim-ts-autotag', event = "InsertEnter", after = "nvim-treesitter" }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require 'user.comments'
        end
    }
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use 'tpope/vim-fugitive'

    use { 'Shougo/defx.nvim', run = ':UpdateRemotePlugins' }
    use 'kristijanhusak/defx-git'

    -- sign column
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require 'user.gitsigns'

        end
    }

    use {
        'akinsho/toggleterm.nvim',
        config = function()
            require 'user.toggleterm'

        end
    }

    use 'tpope/vim-surround'
    use {
        'folke/todo-comments.nvim',
        config = function()
            require 'user.todocomments'

        end
    }

    use {
        'folke/trouble.nvim',
        config = function()
            require 'user.trouble'
        end
    }

    --document highlight
    use "RRethy/vim-illuminate"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then require("packer").sync() end
end)
