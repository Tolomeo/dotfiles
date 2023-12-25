case "$(uname)" in
Darwin)
	if ! xcode-select -p >/dev/null 2>&1; then
		echo "Installing Xcode Command Line Tools"

		xcode-select --install &
		wait $!

		if xcode-select -p >/dev/null 2>&1; then
			echo "Xcode Command Line Tools installed successfully"
		else
			echo "Xcode Command Line Tools installation failed"
			exit 1
		fi
	fi
	;;
Linux)
	echo "Installing system dependencies"

	deps="build-essential procps curl file"

	apt update
	for dep in $deps; do
		sudo apt install -y $dep
	done
	;;
esac
