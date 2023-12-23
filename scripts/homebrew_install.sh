if [ ! -f "$(which brew)" ]; then
	echo 'Installing homebrew'
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo 'Updating homebrew'
	brew update
fi

source ~/.dotfiles/scripts/homebrew_env.sh

echo 'Installing system packages'
brew bundle --file=~/.config/brewfile/Brewfile
