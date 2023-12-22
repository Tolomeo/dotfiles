#!/bin/bash

if [ $(uname) = "Darwin" ]; then
	eval "$(/usr/local/bin/brew shellenv)"
else
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

source "$(brew --prefix)/opt/nvm/nvm.sh"

echo 'Installing system packages'
brew bundle --file=~/.config/brewfile/Brewfile

echo 'Installing node lts'
nvm install --lts

echo 'Using Zsh as default shell'
zsh_path="$(brew --prefix)/bin/zsh"

if [[ "$SHELL" != "$zsh_path" ]]; then
	if ! grep -qx "$zsh_path" "/etc/shells"; then
		sudo tee -a "/etc/shells" <<<"$zsh_path" >/dev/null
		echo "Zsh path added to the shells file"
	fi

	echo 'You will have to logout and log back in'
	chsh -s "$zsh_path" "$(whoami)"
fi
