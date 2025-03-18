source ~/.dotfiles/homebrew/env.sh

export PATH="$HOME/.dotfiles/bin:$PATH"

export VISUAL=nvim
export EDITOR=nvim

if [ -s "$HOME/.zshenv_local" ]; then
	source "$HOME/.zshenv_local"
fi
