if [ ! -f "$(which brew)" ]; then
	echo 'Homebrew was not found, installing from repo'
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo 'Homebrew was found, updating'
	brew update
fi

. ~/.dotfiles/homebrew/env.sh

echo 'Installing homebrew packages'
brew bundle
