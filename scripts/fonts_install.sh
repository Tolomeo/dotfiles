fonts_dir="$(if [ "$(uname)" = "Darwin" ]; then echo "/Library/Fonts"; else echo "$HOME/.local/share/fonts"; fi)"
fonts="SourceCodePro"

if [ ! -d "$fonts_dir" ]; then
	mkdir -p "$fonts_dir"
fi

git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git

for font in $fonts; do
	git -C ./nerd-fonts sparse-checkout add "patched-fonts/${font}"
	./nerd-fonts/install.sh "${font}"
done

rm -rf nerd-fonts
