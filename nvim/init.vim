call plug#begin('~/.vim/plugged')

" gruvbox dependencies
Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'akinsho/bufferline.nvim'


Plug 'neovim/nvim-lspconfig'
" Plug 'glepnir/lspsaga.nvim'
Plug 'jasonrhansen/lspsaga.nvim', {'branch': 'finder-preview-fixes'}
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
Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-commentary'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'tpope/vim-fugitive'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

" sign column
" Plug 'mhinz/vim-signify'
Plug 'lewis6991/gitsigns.nvim'

Plug 'kristijanhusak/defx-git'

Plug 'akinsho/toggleterm.nvim'

" Plug 'vim-test/vim-test'

Plug 'tpope/vim-surround'


call plug#end()

set background=dark
colorscheme gruvbox
" let g:gruvbox_contrast_dark = 'soft'
" colorscheme onehalfdark

" Overwrite gitsigns default color schemes set by gruvbox
hi GitSignsAdd guifg=#8ec07c
hi GitSignsChange guifg=#fabd2f

" gruvbox pmenu settings for autocompletion color since onehalfdark popup
" completion menu has color issue 
"
" Pmenu          xxx ctermfg=0 ctermbg=13 guifg=#EBDBB2 guibg=#4F4945
" PmenuSel       xxx ctermfg=242 ctermbg=0 gui=bold guifg=#4F4945 guibg=#83A598
" PmenuSbar      xxx ctermbg=248 guibg=#4F4945
" PmenuThumb     xxx ctermbg=15 guibg=#7D6F64

hi Pmenu guifg=#EBDBB2 guibg=#4F4945
hi PmenuSbar guibg=#4F4945
hi PmenuSel guifg=#4F4945 guibg=#83A598
hi PmenuThumb guibg=#7D6F64 


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


