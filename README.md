Using neovim >=0.7 with native lsp

Preinstalls:

$ brew install tree-sitter neovim tmux stow

install python3 for defx

install ripgrep for live grep of telescope

$ brew install ripgrep

Clone in dirctory ~/.config

$ stow --ignore=DS_Store -v-S .

To make .tmux.conf available in home direcotry, can use:

$ stow -S tmux -t ~

After tree-sitter plugin installed, check whether parser for each language installed, if not, config like eg:
$ :TSInstall javascript

Config tmux

Install tpm plugin manager

$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

Using prefix + I to install tmux plugins

tmux-resurrect is cloned in home path, Below is the detailed path configured in .tmux.conf file
run-shell ~/tmux-resurrect/resurrect.tmux
