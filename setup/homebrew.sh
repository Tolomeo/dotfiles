if ! command -v brew >/dev/null 2>&1; then
	echo 'Homebrew was not found, installing from repo'
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	. $HOME/.dotfiles/env/homebrew.sh
else
	echo 'Homebrew was found, updating'
	brew update
fi

brew bundle
