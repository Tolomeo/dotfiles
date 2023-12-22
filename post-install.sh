#!/bin/bash

if [ $(uname) = "Darwin" ]; then
	eval "$(/usr/local/bin/brew shellenv)"
else
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"

echo 'Installing system packages'
brew bundle --file=~/.config/brewfile/Brewfile

echo 'Installing node lts'
nvm install --lts

if [ ! "$(basename "$SHELL")" = "zsh" ]; then
	echo 'Changing default shell to Zsh. You will probably have to logout and log back in'
	chsh -s "$(which zsh)" "$(whoami)"

	# Append the zsh path to the shells file
	if grep -qx "$(which zsh)" "/etc/shells"; then
		echo "Zsh is in the shells file"
	else
		echo "$(which zsh)" | tee -a "/etc/shells" >/dev/null
		echo "Zsh path added to the shells file"
	fi
else
	echo 'Using zsh as default shell'
fi
