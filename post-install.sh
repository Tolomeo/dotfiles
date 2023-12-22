#!/bin/bash

if [ $(uname) = "Darwin" ]; then
	eval "$(/usr/local/bin/brew shellenv)"
else
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

brew bundle --file=~/.config/brewfile/Brewfile

nvm install --lts

if [ ! "$(basename "$SHELL")" = "zsh" ]; then
	echo 'Changing default shell to zsh. You will probably have to logout and log back in. You will probably have to logout and log back in'
	chsh -s "$(which zsh)"
else
	echo 'Already using zsh as default shell'
fi
