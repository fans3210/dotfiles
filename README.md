Using neovim >=0.5 with native lsp
Preinstalls:
$ brew install tree-sitter luajit neovim tmux stow

Clone in dirctory ~/.config
$ stow --ignore=DS_Store -v-S .

Plugin manger:
$ sh -c 'curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

Install lanugage servers:
$ npm install -g typescript typescript-language-server
$ npm install -g diagnostic-languageserver

Install linters:
$ npm i -g eslint_d prettier

After tree-sitter plugin installed, check whether parser for each language installed, if not, config like eg:
$ :TSInstall javascript

Config tmux
Install tpm plugin manager
