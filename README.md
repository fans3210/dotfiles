Using neovim >=0.7 with native lsp

Preinstalls:

$ brew install tree-sitter neovim tmux stow

install python3 for defx

install ripgrep for live grep of telescope

$ brew install ripgrep

Clone project in home directory

Stow folders to home directory
$ stow \*/ -t ~

Config tmux

Install tpm plugin manager

$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

Using prefix + I to install tmux plugins

tmux-resurrect is cloned in home path, Below is the detailed path configured in .tmux.conf file
run-shell ~/tmux-resurrect/resurrect.tmux
