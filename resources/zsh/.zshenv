. ~/.dotfiles/env/homebrew.sh
. ~/.dotfiles/env/node.sh
. ~/.dotfiles/env/haxe.sh
. ~/.dotfiles/env/zsh.sh

if [ -s "$HOME/.zshenv_local" ]; then
	source "$HOME/.zshenv_local"
fi
