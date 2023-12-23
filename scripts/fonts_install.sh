fonts="SourceCodePro"

case $(uname) in
Darwin)
	fonts_dir="/Library/Fonts"
	;;
*)
	fonts_dir="$HOME/.local/share/fonts"
	;;
esac

# Check if the fonts directory exists, and create it if not
if [ ! -d "$fonts_dir" ]; then
	mkdir -p "$fonts_dir"
fi

git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git

for font in $fonts; do
	git -C ./nerd-fonts sparse-checkout add "patched-fonts/${font}"
	./nerd-fonts/install.sh "${font}"
done

rm -rf nerd-fonts
