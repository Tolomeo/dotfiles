. ~/.dotfiles/env/homebrew.sh

export NVM_DIR="$HOME/.nvm"

if [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ]; then
	. "$(brew --prefix)/opt/nvm/nvm.sh"
fi
