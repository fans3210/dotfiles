call plug#begin('~/.vim/plugged')

" gruvbox dependencies
" Plug 'rktjmp/lush.nvim'
" Plug 'npxbr/gruvbox.nvim'

Plug 'norcalli/nvim-colorizer.lua'

" top tabs
Plug 'akinsho/bufferline.nvim'
Plug 'numtostr/BufOnly.nvim', { 'on': 'BufOnly' }

" alternative colorscheme
Plug 'sainnhe/everforest'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'tami5/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" completion
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" telescope dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'kyazdani42/nvim-web-devicons'
Plug 'hoob3rt/lualine.nvim'
" Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-autopairs'

Plug 'tpope/vim-commentary'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'tpope/vim-fugitive'

Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-git'

" sign column
" Plug 'mhinz/vim-signify'
Plug 'lewis6991/gitsigns.nvim'


Plug 'akinsho/toggleterm.nvim'

" Plug 'vim-test/vim-test'

Plug 'tpope/vim-surround'
Plug 'folke/todo-comments.nvim'

Plug 'folke/trouble.nvim'

call plug#end()

" gruvbox colorscheme and settings except lualine
" let g:gruvbox_contrast_dark = 'medium'
" set background=dark
" colorscheme gruvbox
" gruvbox specific config Overwrite gitsigns default color schemes set by gruvbox
" hi GitSignsAdd guifg=#8ec07c
" hi GitSignsChange guifg=#fabd2f
" hi GitSignsAddNr guifg=#8ec07c
" hi GitSignsChangeNr guifg=#fabd2f
" hi GitSignsAddLn guifg=#8ec07c
" hi GitSignsChangeLn guifg=#fabd2f

" everforest colorscheme and settings
let g:everforest_background = 'soft'
let g:everforest_diagnostic_virtual_text = 'colored'
set background=dark
colorscheme everforest



let mapleader = " "
nnoremap <silent> Q <nop>
nnoremap <Leader><CR> :source $MYVIMRC<CR>

inoremap jk <Esc>

nnoremap <C-S> :update<cr>
inoremap <C-S> <Esc>:update<cr>

" " insert semicolon at the end of line
" augroup jsfilemapping 
"     autocmd!
"     autocmd Filetype javascript,javascriptreact,typescript,typescriptreact inoremap <expr> <silent>;; getline('.')[-1:] == ";" ? "\<Esc>A" : "\<Esc>A;"
" augroup END

" Funcs for debugging 

" show syntax highlighting groups for word under cursor
nmap <leader>z :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


