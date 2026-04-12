export HOMEBREW_BUNDLE_FILE="$HOME/.dotfiles/resources/homebrew/Brewfile"

if [ $(uname) = "Darwin" ]; then
	eval "$(/usr/local/bin/brew shellenv)"
else
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
