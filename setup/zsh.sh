. ~/.dotfiles/homebrew/env.sh

zsh_path="$(brew --prefix)/bin/zsh"

if [ "$SHELL" != "$zsh_path" ]; then
	echo "$zsh_path is not the default shell"

	if ! grep -qx "$zsh_path" "/etc/shells"; then
		echo "Adding $zsh_path to /etc/shells"
		echo "$zsh_path" | sudo tee -a "/etc/shells" >/dev/null
	fi

	echo "Changing the default shell to $zsh_path, you will have to logout and log back in"
	chsh -s "$zsh_path" "$(whoami)"
else
	echo 'Zsh is installed and is the default shell'
fi
