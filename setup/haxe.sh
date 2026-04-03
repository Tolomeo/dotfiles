. ~/.dotfiles/homebrew/env.sh

haxe_ls_server_root="$HOME/.dotfiles/haxe/haxe-language-server"

cd $haxe_ls_server_root

echo "Installing haxe-language-server dependencies"
npm ci

echo "Compiling haxe-language-server"
npx lix run vshaxe-build -t language-server
if [ $? -eq 0 ]; then
	echo "Haxe-language-server compiled in $haxe_ls_server_root/bin/server.js"
fi

echo "Setting up haxelib"
haxelib setup "$HOME/haxelib"
