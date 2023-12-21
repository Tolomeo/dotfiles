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
