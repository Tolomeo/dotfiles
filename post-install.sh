#!/bin/bash

if [ $(uname) = "Darwin" ]; then
	eval "$(/usr/local/bin/brew shellenv)"
else
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

echo 'Installing system packages'
brew bundle --file=~/.config/brewfile/Brewfile

echo 'Installing node lts'
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"
nvm install --lts

if [ ! "$(basename "$SHELL")" = "zsh" ]; then
	echo 'Changing default shell to zsh. You will probably have to logout and log back in'
	chsh -s "$(which zsh)"
else
	echo 'Using zsh as default shell'
fi
