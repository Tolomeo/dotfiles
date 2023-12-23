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
declare -a fonts=(
	SourceCodePro
)

case $(uname) in
Darwin)
	fonts_dir="/Library/Fonts"
	;;
*)
	fonts_dir="$HOME/.local/share/fonts"
	;;
esac

# Check if the fonts directory exists, and create it if not
if [[ ! -d "$fonts_dir" ]]; then
	mkdir -p "$fonts_dir"
fi

git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts

for font in "${fonts[@]}"; do
	git sparse-checkout add "patched-fonts/${font}"
	./install.sh "${font}"
done

cd ../
rm -rf nerd-fonts
