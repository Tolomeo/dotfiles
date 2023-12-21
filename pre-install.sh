#!/bin/bash

# see https://github.com/iraquitan/iraquitan-dotfiles/blob/master/pre-install.sh

# Check if Homebrew is installed
if [ ! -f "$(which brew)" ]; then
	echo 'Installing homebrew'
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo 'Updating homebrew'
	brew update
fi

# Making zsh the default shell on Linux
# if [ $(uname) = "Linux" ]; then
# 	echo 'Updating apt'
# 	apt update

# 	if [ ! -f "$(which zsh)" ]; then
# 		echo 'Installing zsh'
# 		apt install -y zsh
# 	else
# 		echo "Zsh is installed"
# 	fi

# 	if [ ! "$(basename "$SHELL")" = "zsh" ]; then
# 		echo 'Changing default shell to zsh'
# 		chsh -s "$(which zsh)"
# 	else
# 		echo 'Already using zsh as default shell'
# 	fi
# fi
