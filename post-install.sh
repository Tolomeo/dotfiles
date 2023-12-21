brew bundle --file=$HOME/.config/brewfile/Brewfile

# Change default shell
if [ ! "$(basename "$SHELL")" = "zsh" ]; then
	echo 'Changing default shell to zsh'
	chsh -s /bin/zsh
else
	echo 'Already using zsh'
fi
