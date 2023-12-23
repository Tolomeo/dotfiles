#!/bin/bash

sh ~/.dotfiles/scripts/homebrew_install.sh

echo 'Installing node lts'
source ~/.dotfiles/scripts/homebrew_env.sh
nvm install --lts

echo 'Using Zsh as default shell'
zsh_path="$(brew --prefix)/bin/zsh"

if [ "$SHELL" != "$zsh_path" ]; then
	if ! grep -qx "$zsh_path" "/etc/shells"; then
		echo "$zsh_path" | sudo tee -a "/etc/shells" >/dev/null
		echo "Zsh path added to the shells file"
	fi

	echo 'Changing the default shell, you will have to logout and log back in'
	chsh -s "$zsh_path" "$(whoami)"
fi

echo 'Installing patched fonts'
sh ~/.dotfiles/scripts/fonts_install.sh
