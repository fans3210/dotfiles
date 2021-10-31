Using neovim >=0.5 with native lsp

Preinstalls:

$ brew install tree-sitter luajit neovim tmux stow

install python3 for defx

install ripgrep for live grep of telescope

$ brew install ripgrep


Clone in dirctory ~/.config

$ stow --ignore=DS_Store -v-S .

To make .tmux.conf available in home direcotry, can use:

$ stow -S tmux -t ~

Plugin manger:
$ sh -c 'curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

Install lanugage servers and linters:
$ npm install -g typescript typescript-language-server diagnostic-languageserver prettier_d_slim eslint_d prettier

For Lua language server and prettiers, check:

https://www.chrisatmachine.com/Neovim/28-neovim-lua-development/

After tree-sitter plugin installed, check whether parser for each language installed, if not, config like eg:
$ :TSInstall javascript

Config tmux

Install tpm plugin manager

$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

Using prefix + I to install tmux plugins


tmux-resurrect is cloned in home path, Below is the detailed path configured in .tmux.conf file
run-shell ~/tmux-resurrect/resurrect.tmux
